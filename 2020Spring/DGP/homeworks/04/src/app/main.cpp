//***************************************************************************************
// HW02App.cpp by Frank Luna (C) 2015 All Rights Reserved.
//***************************************************************************************


#include "../common/d3dApp.h"
#include "../common/MathHelper.h"
#include <UDX12/UploadBuffer.h>
#include "../common/GeometryGenerator.h"
#include "util.h"

#include <Eigen/Sparse>

using Microsoft::WRL::ComPtr;
using namespace DirectX;
using namespace DirectX::PackedVector;

const int gNumFrameResources = 3;

struct V : Ubpa::TVertex<Ubpa::HEMeshTriats_EmptyEP<V>> {
	Ubpa::pointf3 pos;
	Ubpa::pointf2 uv;
};

struct ObjectConstants
{
	DirectX::XMFLOAT4X4 World = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 TexTransform = MathHelper::Identity4x4();
};

struct PassConstants
{
	DirectX::XMFLOAT4X4 View = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 InvView = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 Proj = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 InvProj = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 ViewProj = MathHelper::Identity4x4();
	DirectX::XMFLOAT4X4 InvViewProj = MathHelper::Identity4x4();
	DirectX::XMFLOAT3 EyePosW = { 0.0f, 0.0f, 0.0f };
	float cbPerObjectPad1 = 0.0f;
	DirectX::XMFLOAT2 RenderTargetSize = { 0.0f, 0.0f };
	DirectX::XMFLOAT2 InvRenderTargetSize = { 0.0f, 0.0f };
	float NearZ = 0.0f;
	float FarZ = 0.0f;
	float TotalTime = 0.0f;
	float DeltaTime = 0.0f;

	DirectX::XMFLOAT4 AmbientLight = { 0.0f, 0.0f, 0.0f, 1.0f };

	// Indices [0, NUM_DIR_LIGHTS) are directional lights;
	// indices [NUM_DIR_LIGHTS, NUM_DIR_LIGHTS+NUM_POINT_LIGHTS) are point lights;
	// indices [NUM_DIR_LIGHTS+NUM_POINT_LIGHTS, NUM_DIR_LIGHTS+NUM_POINT_LIGHT+NUM_SPOT_LIGHTS)
	// are spot lights for a maximum of MaxLights per object.
	Light Lights[MaxLights];
};

struct Vertex
{
	DirectX::XMFLOAT3 Pos;
	DirectX::XMFLOAT3 Normal;
	DirectX::XMFLOAT2 TexC;
};

// Lightweight structure stores parameters to draw a shape.  This will
// vary from app-to-app.
struct RenderItem
{
	RenderItem() = default;

    // World matrix of the shape that describes the object's local space
    // relative to the world space, which defines the position, orientation,
    // and scale of the object in the world.
    XMFLOAT4X4 World = MathHelper::Identity4x4();

	XMFLOAT4X4 TexTransform = MathHelper::Identity4x4();

	// Dirty flag indicating the object data has changed and we need to update the constant buffer.
	// Because we have an object cbuffer for each FrameResource, we have to apply the
	// update to each FrameResource.  Thus, when we modify obect data we should set 
	// NumFramesDirty = gNumFrameResources so that each frame resource gets the update.
	int NumFramesDirty = gNumFrameResources;

	// Index into GPU constant buffer corresponding to the ObjectCB for this render item.
	UINT ObjCBIndex = -1;

	Material* Mat = nullptr;
	Ubpa::DX12::MeshGeometry* Geo = nullptr;
	//std::string Geo;

    // Primitive topology.
    D3D12_PRIMITIVE_TOPOLOGY PrimitiveType = D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST;

    // DrawIndexedInstanced parameters.
    UINT IndexCount = 0;
    UINT StartIndexLocation = 0;
    int BaseVertexLocation = 0;
};

class HW04App : public D3DApp
{
public:
    HW04App(HINSTANCE hInstance);
    HW04App(const HW04App& rhs) = delete;
    HW04App& operator=(const HW04App& rhs) = delete;
    ~HW04App();

    virtual bool Initialize()override;

private:
    virtual void OnResize()override;
    virtual void Update(const GameTimer& gt)override;
    virtual void Draw(const GameTimer& gt)override;

    virtual void OnMouseDown(WPARAM btnState, int x, int y)override;
    virtual void OnMouseUp(WPARAM btnState, int x, int y)override;
    virtual void OnMouseMove(WPARAM btnState, int x, int y)override;

    void OnKeyboardInput(const GameTimer& gt);
	void UpdateCamera(const GameTimer& gt);
	void AnimateMaterials(const GameTimer& gt);
	void UpdateObjectCBs(const GameTimer& gt);
	void UpdateMaterialCBs(const GameTimer& gt);
	void UpdateMainPassCB(const GameTimer& gt);

	void LoadTextures();
    void BuildRootSignature();
	void BuildDescriptorHeaps();
    void BuildShadersAndInputLayout();
    void BuildShapeGeometry();
    void BuildPSOs();
    void BuildFrameResources();
    void BuildMaterials();
    void BuildRenderItems();
    void DrawRenderItems(ID3D12GraphicsCommandList* cmdList, const std::vector<RenderItem*>& ritems);

	std::array<const CD3DX12_STATIC_SAMPLER_DESC, 6> GetStaticSamplers();

private:

	std::vector<std::unique_ptr<Ubpa::DX12::FrameResource>> mFrameResources;
	Ubpa::DX12::FrameResource* mCurrFrameResource = nullptr;
    int mCurrFrameResourceIndex = 0;

	std::unordered_map<std::string, std::unique_ptr<Material>> mMaterials;

    std::vector<D3D12_INPUT_ELEMENT_DESC> mInputLayout;
 
	// List of all the render items.
	std::vector<std::unique_ptr<RenderItem>> mAllRitems;

	// Render items divided by PSO.
	std::vector<RenderItem*> mOpaqueRitems;

    PassConstants mMainPassCB;

	XMFLOAT3 mEyePos = { 0.0f, 0.0f, 0.0f };
	XMFLOAT4X4 mView = MathHelper::Identity4x4();
	XMFLOAT4X4 mProj = MathHelper::Identity4x4();

	float mTheta = 1.3f*XM_PI;
	float mPhi = 0.4f*XM_PI;
	float mRadius = 2.5f;

    POINT mLastMousePos;

	std::unordered_map<std::string, std::unique_ptr<Ubpa::TriMesh>> trimeshes;

	// frame graph
	//Ubpa::DX12::FG::RsrcMngr fgRsrcMngr;
	Ubpa::DX12::FG::Executor fgExecutor;
	Ubpa::FG::Compiler fgCompiler;
	Ubpa::FG::FrameGraph fg;
};

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE prevInstance,
    PSTR cmdLine, int showCmd)
{
    // Enable run-time memory check for debug builds.
#if defined(DEBUG) | defined(_DEBUG)
    _CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);
#endif

    try
    {
        HW04App theApp(hInstance);
        if(!theApp.Initialize())
            return 0;

        int rst = theApp.Run();
		Ubpa::DXRenderer::Instance().Release();
		return rst;
    }
    catch(Ubpa::DX12::Util::Exception& e)
    {
        MessageBox(nullptr, e.ToString().c_str(), L"HR Failed", MB_OK);
        return 0;
    }

}

HW04App::HW04App(HINSTANCE hInstance)
    : D3DApp(hInstance)
{
}

HW04App::~HW04App()
{
    if(!uDevice.IsNull())
        FlushCommandQueue();
}

bool HW04App::Initialize()
{
    if(!D3DApp::Initialize())
        return false;

	Ubpa::DXRenderer::Instance().Init(uDevice.raw.Get());

	Ubpa::DX12::DescriptorHeapMngr::Instance().Init(uDevice.raw.Get(), 1024, 1024, 1024, 1024, 1024);

	//fgRsrcMngr.Init(uGCmdList, uDevice);

    // Reset the command list to prep for initialization commands.
    ThrowIfFailed(uGCmdList->Reset(mDirectCmdListAlloc.Get(), nullptr));

    // Get the increment size of a descriptor in this heap type.  This is hardware specific, 
	// so we have to query this information.
    //mCbvSrvDescriptorSize = uDevice->GetDescriptorHandleIncrementSize(D3D12_DESCRIPTOR_HEAP_TYPE_CBV_SRV_UAV);

	Ubpa::DXRenderer::Instance().GetUpload().Begin();
 
	LoadTextures();
    BuildRootSignature();
	BuildDescriptorHeaps();
    BuildShadersAndInputLayout();
    BuildShapeGeometry();
	BuildMaterials();
    BuildRenderItems();
    BuildFrameResources();
    BuildPSOs();

    // Execute the initialization commands.
    ThrowIfFailed(uGCmdList->Close());
	uCmdQueue.Execute(uGCmdList.raw.Get());

	Ubpa::DXRenderer::Instance().GetUpload().End(uCmdQueue.raw.Get());

    // Wait until initialization is complete.
    FlushCommandQueue();

    return true;
}
 
void HW04App::OnResize()
{
    D3DApp::OnResize();

    // The window resized, so update the aspect ratio and recompute the projection matrix.
    XMMATRIX P = XMMatrixPerspectiveFovLH(0.25f*MathHelper::Pi, AspectRatio(), 1.0f, 1000.0f);
    XMStoreFloat4x4(&mProj, P);

	auto clearFGRsrcMngr = [](void* rsrcMngr) {
		reinterpret_cast<Ubpa::DX12::FG::RsrcMngr*>(rsrcMngr)->Clear();
	};
	for (auto& frsrc : mFrameResources)
		frsrc->DelayUpdateResource("FrameGraphRsrcMngr", clearFGRsrcMngr);
}

void HW04App::Update(const GameTimer& gt)
{
    OnKeyboardInput(gt);
	UpdateCamera(gt);

    // Cycle through the circular frame resource array.
    mCurrFrameResourceIndex = (mCurrFrameResourceIndex + 1) % gNumFrameResources;
    mCurrFrameResource = mFrameResources[mCurrFrameResourceIndex].get();

    // Has the GPU finished processing the commands of the current frame resource?
    // If not, wait until the GPU has completed commands up to this fence point.
	mCurrFrameResource->Wait();

	AnimateMaterials(gt);
	UpdateObjectCBs(gt);
	UpdateMaterialCBs(gt);
	UpdateMainPassCB(gt);
}

void HW04App::Draw(const GameTimer& gt)
{
	auto cmdListAlloc = mCurrFrameResource->GetResource<ID3D12CommandAllocator>("CommandAllocator");

    // Reuse the memory associated with command recording.
    // We can only reset when the associated command lists have finished execution on the GPU.
    ThrowIfFailed(cmdListAlloc->Reset());

    // A command list can be reset after it has been added to the command queue via ExecuteCommandList.
    // Reusing the command list reuses memory.
	ThrowIfFailed(uGCmdList->Reset(cmdListAlloc, nullptr));
	uGCmdList.SetDescriptorHeaps(Ubpa::DX12::DescriptorHeapMngr::Instance().GetCSUGpuDH()->GetDescriptorHeap());

	uGCmdList->RSSetViewports(1, &mScreenViewport);
	uGCmdList->RSSetScissorRects(1, &mScissorRect);

	fg.Clear();
	auto fgRsrcMngr = mCurrFrameResource->GetResource<Ubpa::DX12::FG::RsrcMngr>("FrameGraphRsrcMngr");
	fgRsrcMngr->NewFrame();
	fgExecutor.NewFrame();;

	auto gbuffer0 = fg.AddResourceNode("GBuffer0");
	auto gbuffer1 = fg.AddResourceNode("GBuffer1");
	auto gbuffer2 = fg.AddResourceNode("GBuffer2");
	auto backbuffer = fg.AddResourceNode("Back Buffer");
	auto depthstencil = fg.AddResourceNode("Depth Stencil");
	auto gbPass = fg.AddPassNode(
		"GBuffer Pass",
		{},
		{ gbuffer0,gbuffer1,gbuffer2,depthstencil }
	);
	/*auto debugPass = fg.AddPassNode(
		"Debug",
		{ gbuffer1 },
		{ backbuffer }
	);*/
	auto deferLightingPass = fg.AddPassNode(
		"Defer Lighting",
		{ gbuffer0,gbuffer1,gbuffer2 },
		{ backbuffer }
	);

	(*fgRsrcMngr)
		.RegisterTemporalRsrc(gbuffer0,
			Ubpa::DX12::FG::RsrcType::RT2D(DXGI_FORMAT_R32G32B32A32_FLOAT, mClientWidth, mClientHeight, Colors::Black))
		.RegisterTemporalRsrc(gbuffer1,
			Ubpa::DX12::FG::RsrcType::RT2D(DXGI_FORMAT_R32G32B32A32_FLOAT, mClientWidth, mClientHeight, Colors::Black))
		.RegisterTemporalRsrc(gbuffer2,
			Ubpa::DX12::FG::RsrcType::RT2D(DXGI_FORMAT_R32G32B32A32_FLOAT, mClientWidth, mClientHeight, Colors::Black))

		.RegisterRsrcTable({
			{gbuffer0,Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT)},
			{gbuffer1,Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT)},
			{gbuffer2,Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT)} })

		.RegisterImportedRsrc(backbuffer, { CurrentBackBuffer(), D3D12_RESOURCE_STATE_PRESENT })
		.RegisterImportedRsrc(depthstencil, { mDepthStencilBuffer.Get(), D3D12_RESOURCE_STATE_DEPTH_WRITE })

		.RegisterPassRsrcs(gbPass, gbuffer0, D3D12_RESOURCE_STATE_RENDER_TARGET,
			Ubpa::DX12::FG::RsrcImplDesc_RTV_Null{})
		.RegisterPassRsrcs(gbPass, gbuffer1, D3D12_RESOURCE_STATE_RENDER_TARGET,
			Ubpa::DX12::FG::RsrcImplDesc_RTV_Null{})
		.RegisterPassRsrcs(gbPass, gbuffer2, D3D12_RESOURCE_STATE_RENDER_TARGET,
			Ubpa::DX12::FG::RsrcImplDesc_RTV_Null{})
		.RegisterPassRsrcs(gbPass, depthstencil,
			D3D12_RESOURCE_STATE_DEPTH_WRITE, Ubpa::DX12::Desc::DSV::Basic(mDepthStencilFormat))

		/*.RegisterPassRsrcs(debugPass, gbuffer1, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE,
			Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT))

		.RegisterPassRsrcs(debugPass, backbuffer, D3D12_RESOURCE_STATE_RENDER_TARGET,
			Ubpa::DX12::FG::RsrcImplDesc_RTV_Null{})*/

		.RegisterPassRsrcs(deferLightingPass, gbuffer0, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE,
			Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT))
		.RegisterPassRsrcs(deferLightingPass, gbuffer1, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE,
			Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT))
		.RegisterPassRsrcs(deferLightingPass, gbuffer2, D3D12_RESOURCE_STATE_PIXEL_SHADER_RESOURCE,
			Ubpa::DX12::Desc::SRV::Tex2D(DXGI_FORMAT_R32G32B32A32_FLOAT))

		.RegisterPassRsrcs(deferLightingPass, backbuffer, D3D12_RESOURCE_STATE_RENDER_TARGET,
			Ubpa::DX12::FG::RsrcImplDesc_RTV_Null{})
		;

	fgExecutor.RegisterPassFunc(
		gbPass,
		[&](const Ubpa::DX12::FG::PassRsrcs& rsrcs) {
			uGCmdList->SetPipelineState(Ubpa::DXRenderer::Instance().GetPSO("geometry"));
			auto gb0 = rsrcs.find(gbuffer0)->second;
			auto gb1 = rsrcs.find(gbuffer1)->second;
			auto gb2 = rsrcs.find(gbuffer2)->second;
			auto ds = rsrcs.find(depthstencil)->second;

			// Clear the render texture and depth buffer.
			uGCmdList.ClearRenderTargetView(gb0.cpuHandle, Colors::Black);
			uGCmdList.ClearRenderTargetView(gb1.cpuHandle, Colors::Black);
			uGCmdList.ClearRenderTargetView(gb2.cpuHandle, Colors::Black);
			uGCmdList.ClearDepthStencilView(ds.cpuHandle);

			// Specify the buffers we are going to render to.
			std::array rts{ gb0.cpuHandle,gb1.cpuHandle,gb2.cpuHandle };
			uGCmdList->OMSetRenderTargets(rts.size(), rts.data(), false, &ds.cpuHandle);

			uGCmdList->SetGraphicsRootSignature(Ubpa::DXRenderer::Instance().GetRootSignature("geometry"));

			auto passCB = mCurrFrameResource
				->GetResource<Ubpa::DX12::ArrayUploadBuffer<PassConstants>>("gbPass constants")
				->GetResource();
			uGCmdList->SetGraphicsRootConstantBufferView(2, passCB->GetGPUVirtualAddress());

			DrawRenderItems(uGCmdList.raw.Get(), mOpaqueRitems);
		}
	);

	//fgExecutor.RegisterPassFunc(
	//	debugPass,
	//	[&](const Ubpa::DX12::FG::PassRsrcs& rsrcs) {
	//		uGCmdList->SetPipelineState(Ubpa::DXRenderer::Instance().GetPSO("screen"));
	//		auto img = rsrcs.find(gbuffer1)->second;
	//		auto bb = rsrcs.find(backbuffer)->second;
	//		
	//		//uGCmdList->CopyResource(bb.resource, rt.resource);

	//		// Clear the render texture and depth buffer.
	//		uGCmdList.ClearRenderTargetView(bb.cpuHandle, Colors::LightSteelBlue);

	//		// Specify the buffers we are going to render to.
	//		//uGCmdList.OMSetRenderTarget(bb.cpuHandle, ds.cpuHandle);
	//		uGCmdList->OMSetRenderTargets(1, &bb.cpuHandle, false, nullptr);

	//		uGCmdList->SetGraphicsRootSignature(Ubpa::DXRenderer::Instance().GetRootSignature("screen"));

	//		uGCmdList->SetGraphicsRootDescriptorTable(0, img.gpuHandle);

	//		uGCmdList->IASetVertexBuffers(0, 0, nullptr);
	//		uGCmdList->IASetIndexBuffer(nullptr);
	//		uGCmdList->IASetPrimitiveTopology(D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST);
	//		uGCmdList->DrawInstanced(6, 1, 0, 0);
	//	}
	//);

	fgExecutor.RegisterPassFunc(
		deferLightingPass,
		[&](const Ubpa::DX12::FG::PassRsrcs& rsrcs) {
			uGCmdList->SetPipelineState(Ubpa::DXRenderer::Instance().GetPSO("defer lighting"));
			auto gb0 = rsrcs.find(gbuffer0)->second;
			auto gb1 = rsrcs.find(gbuffer1)->second;
			auto gb2 = rsrcs.find(gbuffer2)->second;

			auto bb = rsrcs.find(backbuffer)->second;

			//uGCmdList->CopyResource(bb.resource, rt.resource);

			// Clear the render texture and depth buffer.
			uGCmdList.ClearRenderTargetView(bb.cpuHandle, Colors::LightSteelBlue);

			// Specify the buffers we are going to render to.
			//uGCmdList.OMSetRenderTarget(bb.cpuHandle, ds.cpuHandle);
			uGCmdList->OMSetRenderTargets(1, &bb.cpuHandle, false, nullptr);

			uGCmdList->SetGraphicsRootSignature(Ubpa::DXRenderer::Instance().GetRootSignature("defer lighting"));

			uGCmdList->SetGraphicsRootDescriptorTable(0, gb0.gpuHandle);

			uGCmdList->IASetVertexBuffers(0, 0, nullptr);
			uGCmdList->IASetIndexBuffer(nullptr);
			uGCmdList->IASetPrimitiveTopology(D3D_PRIMITIVE_TOPOLOGY_TRIANGLELIST);
			uGCmdList->DrawInstanced(6, 1, 0, 0);
		}
	);

	static bool flag{ false };
	if (!flag) {
		OutputDebugStringA(fg.ToGraphvizGraph().Dump().c_str());
		flag = true;
	}

	auto [success, crst] = fgCompiler.Compile(fg);
	fgExecutor.Execute(crst, *fgRsrcMngr);

    // Done recording commands.
    ThrowIfFailed(uGCmdList->Close());

    // Add the command list to the queue for execution.
	uCmdQueue.Execute(uGCmdList.raw.Get());

    // Swap the back and front buffers
    ThrowIfFailed(mSwapChain->Present(0, 0));
	mCurrBackBuffer = (mCurrBackBuffer + 1) % SwapChainBufferCount;

	mCurrFrameResource->Signal(uCmdQueue.raw.Get(), ++mCurrentFence);
}

void HW04App::OnMouseDown(WPARAM btnState, int x, int y)
{
    mLastMousePos.x = x;
    mLastMousePos.y = y;

    SetCapture(mhMainWnd);
}

void HW04App::OnMouseUp(WPARAM btnState, int x, int y)
{
    ReleaseCapture();
}

void HW04App::OnMouseMove(WPARAM btnState, int x, int y)
{
    if((btnState & MK_LBUTTON) != 0)
    {
        // Make each pixel correspond to a quarter of a degree.
        float dx = XMConvertToRadians(0.25f*static_cast<float>(x - mLastMousePos.x));
        float dy = XMConvertToRadians(0.25f*static_cast<float>(y - mLastMousePos.y));

        // Update angles based on input to orbit camera around box.
        mTheta += dx;
        mPhi += dy;

        // Restrict the angle mPhi.
        mPhi = MathHelper::Clamp(mPhi, 0.1f, MathHelper::Pi - 0.1f);
    }
    else if((btnState & MK_RBUTTON) != 0)
    {
        // Make each pixel correspond to 0.2 unit in the scene.
        float dx = 0.05f*static_cast<float>(x - mLastMousePos.x);
        float dy = 0.05f*static_cast<float>(y - mLastMousePos.y);

        // Update the camera radius based on input.
        mRadius += dx - dy;

        // Restrict the radius.
        mRadius = MathHelper::Clamp(mRadius, 2.0f, 150.0f);
    }

    mLastMousePos.x = x;
    mLastMousePos.y = y;
}
 
void HW04App::OnKeyboardInput(const GameTimer& gt)
{
}
 
void HW04App::UpdateCamera(const GameTimer& gt)
{
	// Convert Spherical to Cartesian coordinates.
	mEyePos.x = mRadius*sinf(mPhi)*cosf(mTheta);
	mEyePos.z = mRadius*sinf(mPhi)*sinf(mTheta);
	mEyePos.y = mRadius*cosf(mPhi);

	// Build the view matrix.
	XMVECTOR pos = XMVectorSet(mEyePos.x, mEyePos.y, mEyePos.z, 1.0f);
	XMVECTOR target = XMVectorZero();
	XMVECTOR up = XMVectorSet(0.0f, 1.0f, 0.0f, 0.0f);

	XMMATRIX view = XMMatrixLookAtLH(pos, target, up);
	XMStoreFloat4x4(&mView, view);
}

void HW04App::AnimateMaterials(const GameTimer& gt)
{
	
}

void HW04App::UpdateObjectCBs(const GameTimer& gt)
{
	auto currObjectCB = mCurrFrameResource
		->GetResource<Ubpa::DX12::ArrayUploadBuffer<ObjectConstants>>("ArrayUploadBuffer<ObjectConstants>");
	for(auto& e : mAllRitems)
	{
		// Only update the cbuffer data if the constants have changed.  
		// This needs to be tracked per frame resource.
		if(e->NumFramesDirty > 0)
		{
			XMMATRIX world = XMLoadFloat4x4(&e->World);
			XMMATRIX texTransform = XMLoadFloat4x4(&e->TexTransform);

			ObjectConstants objConstants;
			XMStoreFloat4x4(&objConstants.World, XMMatrixTranspose(world));
			XMStoreFloat4x4(&objConstants.TexTransform, XMMatrixTranspose(texTransform));

			currObjectCB->Set(e->ObjCBIndex, objConstants);

			// Next FrameResource need to be updated too.
			e->NumFramesDirty--;
		}
	}
}

void HW04App::UpdateMaterialCBs(const GameTimer& gt)
{
	auto currMaterialCB = mCurrFrameResource
		->GetResource<Ubpa::DX12::ArrayUploadBuffer<MaterialConstants>>("ArrayUploadBuffer<MaterialConstants>");
	for(auto& e : mMaterials)
	{
		// Only update the cbuffer data if the constants have changed.  If the cbuffer
		// data changes, it needs to be updated for each FrameResource.
		Material* mat = e.second.get();
		if(mat->NumFramesDirty > 0)
		{
			XMMATRIX matTransform = XMLoadFloat4x4(&mat->MatTransform);

			MaterialConstants matConstants;
			matConstants.DiffuseAlbedo = mat->DiffuseAlbedo;
			matConstants.FresnelR0 = mat->FresnelR0;
			matConstants.Roughness = mat->Roughness;
			XMStoreFloat4x4(&matConstants.MatTransform, XMMatrixTranspose(matTransform));

			currMaterialCB->Set(mat->MatCBIndex, matConstants);

			// Next FrameResource need to be updated too.
			mat->NumFramesDirty--;
		}
	}
}

void HW04App::UpdateMainPassCB(const GameTimer& gt)
{
	XMMATRIX view = XMLoadFloat4x4(&mView);
	XMMATRIX proj = XMLoadFloat4x4(&mProj);

	XMMATRIX viewProj = XMMatrixMultiply(view, proj);
	XMMATRIX invView = XMMatrixInverse(&XMMatrixDeterminant(view), view);
	XMMATRIX invProj = XMMatrixInverse(&XMMatrixDeterminant(proj), proj);
	XMMATRIX invViewProj = XMMatrixInverse(&XMMatrixDeterminant(viewProj), viewProj);

	XMStoreFloat4x4(&mMainPassCB.View, XMMatrixTranspose(view));
	XMStoreFloat4x4(&mMainPassCB.InvView, XMMatrixTranspose(invView));
	XMStoreFloat4x4(&mMainPassCB.Proj, XMMatrixTranspose(proj));
	XMStoreFloat4x4(&mMainPassCB.InvProj, XMMatrixTranspose(invProj));
	XMStoreFloat4x4(&mMainPassCB.ViewProj, XMMatrixTranspose(viewProj));
	XMStoreFloat4x4(&mMainPassCB.InvViewProj, XMMatrixTranspose(invViewProj));
	mMainPassCB.EyePosW = mEyePos;
	mMainPassCB.RenderTargetSize = XMFLOAT2((float)mClientWidth, (float)mClientHeight);
	mMainPassCB.InvRenderTargetSize = XMFLOAT2(1.0f / mClientWidth, 1.0f / mClientHeight);
	mMainPassCB.NearZ = 1.0f;
	mMainPassCB.FarZ = 1000.0f;
	mMainPassCB.TotalTime = gt.TotalTime();
	mMainPassCB.DeltaTime = gt.DeltaTime();
	mMainPassCB.AmbientLight = { 0.25f, 0.25f, 0.35f, 1.0f };
	mMainPassCB.Lights[0].Direction = { 0.57735f, -0.57735f, 0.57735f };
	mMainPassCB.Lights[0].Strength = { 0.6f, 0.6f, 0.6f };
	mMainPassCB.Lights[1].Direction = { -0.57735f, -0.57735f, 0.57735f };
	mMainPassCB.Lights[1].Strength = { 0.3f, 0.3f, 0.3f };
	mMainPassCB.Lights[2].Direction = { 0.0f, -0.707f, -0.707f };
	mMainPassCB.Lights[2].Strength = { 0.15f, 0.15f, 0.15f };

	auto currPassCB = mCurrFrameResource
		->GetResource<Ubpa::DX12::ArrayUploadBuffer<PassConstants>>("gbPass constants");
	currPassCB->Set(0, mMainPassCB);
}

void HW04App::LoadTextures()
{
	std::array<std::wstring_view, 3> ironTextures{
		L"../data/textures/iron/albedo.dds",
		L"../data/textures/iron/roughness.dds",
		L"../data/textures/iron/metalness.dds"
	};

	Ubpa::DXRenderer::Instance().RegisterDDSTextureArrayFromFile(
		Ubpa::DXRenderer::Instance().GetUpload(),
		"iron",
		ironTextures.data(), ironTextures.size());
}

void HW04App::BuildRootSignature()
{
	{ // geometry
		CD3DX12_DESCRIPTOR_RANGE texTable;
		texTable.Init(D3D12_DESCRIPTOR_RANGE_TYPE_SRV, 3, 0);

		// Root parameter can be a table, root descriptor or root constants.
		CD3DX12_ROOT_PARAMETER slotRootParameter[4];

		// Perfomance TIP: Order from most frequent to least frequent.
		slotRootParameter[0].InitAsDescriptorTable(1, &texTable, D3D12_SHADER_VISIBILITY_PIXEL);
		slotRootParameter[1].InitAsConstantBufferView(0);
		slotRootParameter[2].InitAsConstantBufferView(1);
		slotRootParameter[3].InitAsConstantBufferView(2);

		auto staticSamplers = GetStaticSamplers();

		// A root signature is an array of root parameters.
		CD3DX12_ROOT_SIGNATURE_DESC rootSigDesc(4, slotRootParameter,
			(UINT)staticSamplers.size(), staticSamplers.data(),
			D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT);

		Ubpa::DXRenderer::Instance().RegisterRootSignature("geometry", &rootSigDesc);
	}

	{ // screen
		CD3DX12_DESCRIPTOR_RANGE texTable;
		texTable.Init(D3D12_DESCRIPTOR_RANGE_TYPE_SRV, 1, 0);

		// Root parameter can be a table, root descriptor or root constants.
		CD3DX12_ROOT_PARAMETER slotRootParameter[1];

		// Perfomance TIP: Order from most frequent to least frequent.
		slotRootParameter[0].InitAsDescriptorTable(1, &texTable, D3D12_SHADER_VISIBILITY_PIXEL);

		auto staticSamplers = GetStaticSamplers();

		// A root signature is an array of root parameters.
		CD3DX12_ROOT_SIGNATURE_DESC rootSigDesc(1, slotRootParameter,
			(UINT)staticSamplers.size(), staticSamplers.data(),
			D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT);

		Ubpa::DXRenderer::Instance().RegisterRootSignature("screen", &rootSigDesc);
	}
	{ // defer lighting
		CD3DX12_DESCRIPTOR_RANGE texTable;
		texTable.Init(D3D12_DESCRIPTOR_RANGE_TYPE_SRV, 3, 0);

		// Root parameter can be a table, root descriptor or root constants.
		CD3DX12_ROOT_PARAMETER slotRootParameter[4];

		// Perfomance TIP: Order from most frequent to least frequent.
		slotRootParameter[0].InitAsDescriptorTable(1, &texTable, D3D12_SHADER_VISIBILITY_PIXEL);
		slotRootParameter[1].InitAsConstantBufferView(0);
		slotRootParameter[2].InitAsConstantBufferView(1);
		slotRootParameter[3].InitAsConstantBufferView(2);

		auto staticSamplers = GetStaticSamplers();

		// A root signature is an array of root parameters.
		CD3DX12_ROOT_SIGNATURE_DESC rootSigDesc(4, slotRootParameter,
			(UINT)staticSamplers.size(), staticSamplers.data(),
			D3D12_ROOT_SIGNATURE_FLAG_ALLOW_INPUT_ASSEMBLER_INPUT_LAYOUT);

		Ubpa::DXRenderer::Instance().RegisterRootSignature("defer lighting", &rootSigDesc);
	}
}

void HW04App::BuildDescriptorHeaps()
{
}

void HW04App::BuildShadersAndInputLayout()
{
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("standardVS",
		L"..\\data\\shaders\\Default.hlsl", nullptr, "VS", "vs_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("opaquePS",
		L"..\\data\\shaders\\Default.hlsl", nullptr, "PS", "ps_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("screenVS",
		L"..\\data\\shaders\\Screen.hlsl", nullptr, "VS", "vs_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("screenPS",
		L"..\\data\\shaders\\Screen.hlsl", nullptr, "PS", "ps_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("geometryVS",
		L"..\\data\\shaders\\Geometry.hlsl", nullptr, "VS", "vs_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("geometryPS",
		L"..\\data\\shaders\\Geometry.hlsl", nullptr, "PS", "ps_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("deferLightingVS",
		L"..\\data\\shaders\\deferLighting.hlsl", nullptr, "VS", "vs_5_0");
	Ubpa::DXRenderer::Instance().RegisterShaderByteCode("deferLightingPS",
		L"..\\data\\shaders\\deferLighting.hlsl", nullptr, "PS", "ps_5_0");
	
    mInputLayout =
    {
        { "POSITION", 0, DXGI_FORMAT_R32G32B32_FLOAT, 0, 0, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0 },
        { "NORMAL", 0, DXGI_FORMAT_R32G32B32_FLOAT, 0, 12, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0 },
		{ "TEXCOORD", 0, DXGI_FORMAT_R32G32_FLOAT, 0, 24, D3D12_INPUT_CLASSIFICATION_PER_VERTEX_DATA, 0 }
    };
}

void HW04App::BuildShapeGeometry()
{
	std::vector<Vertex> orig_vertices;
	std::vector<Vertex> param_vertices;
	std::vector<std::uint32_t> indices;

	auto bunny = std::make_unique<Ubpa::TriMesh>("../data/meshes/Bunny_head.obj");

	bunny->CombineSamePositionVertex();
	bunny->ScaleToUnit();

	orig_vertices.resize(bunny->VertexNumber());
	param_vertices.resize(bunny->VertexNumber());
	indices.resize(3 * bunny->TriangleNumber());
	for (size_t i = 0; i < bunny->VertexNumber(); i++) {
		orig_vertices[i].Pos = bunny->positions[i].as<XMFLOAT3>();

		orig_vertices[i].Normal = bunny->normals[i].as<XMFLOAT3>();

		orig_vertices[i].TexC = bunny->texcoords[i].as<XMFLOAT2>();
	}
	for (size_t i = 0; i < bunny->TriangleNumber(); i++) {
		indices[3 * i + 0] = bunny->indices[i][0];
		indices[3 * i + 1] = bunny->indices[i][1];
		indices[3 * i + 2] = bunny->indices[i][2];
	}

	Ubpa::HEMesh<Ubpa::HEMeshTriats_EmptyEP<V>> hemesh(std::vector<size_t>{indices.begin(), indices.end()}, 3);
	assert(hemesh.IsValid() && hemesh.IsTriMesh() && hemesh.NumBoundaries() == 1);

	for (size_t i = 0; i < orig_vertices.size(); i++)
		hemesh.Vertices().at(i)->pos = reinterpret_cast<Ubpa::pointf3&>(orig_vertices[i].Pos);

	auto boundary = hemesh.Boundaries().front();
	float boundaryLength = 0.f;
	for (auto he : boundary) {
		auto p0 = he->Origin()->pos;
		auto p1 = he->End()->pos;
		boundaryLength += p0.distance(p1);
	}

	// set boundary to square
	// (0, 0) -> (1, 0) -> (1, 1) -> (0, 1) -> (0, 0)
	float accumulateLength = 0.f;
	for (auto he : boundary) {
		float t = accumulateLength / boundaryLength;
		float s = t * 4 - static_cast<int>(t * 4);

		if (t < 0.25f)
			he->Origin()->uv = { s, 0 };
		else if (t < 0.50f)
			he->Origin()->uv = { 1, s };
		else if (t < 0.75f)
			he->Origin()->uv = { 1 - s, 1 };
		else /* if (t < 1.00f)*/
			he->Origin()->uv = { 0, 1 - s };

		auto p0 = he->Origin()->pos;
		auto p1 = he->End()->pos;
		accumulateLength += p0.distance(p1);
	}

	size_t N = orig_vertices.size();
	Eigen::SparseMatrix<float> A(N, N);
	Eigen::MatrixXf b(N, 2);
	std::vector<Eigen::Triplet<float>> triplets;
	for (auto v : hemesh.Vertices()) {
		auto vIdx = hemesh.Index(v);
		if (v->IsBoundary()) {
			b(vIdx, 0) = v->uv[0];
			b(vIdx, 1) = v->uv[1];
			triplets.emplace_back(vIdx, vIdx, 1.f);
		}
		else {
			for (auto u : v->AdjVertices()) {
				b(vIdx, 0) = 0.f;
				b(vIdx, 1) = 0.f;
				triplets.emplace_back(vIdx, hemesh.Index(u), 1.f);
			}
			triplets.emplace_back(vIdx, vIdx, -static_cast<int>(v->Degree()));
		}
	}
	A.setFromTriplets(triplets.begin(), triplets.end());
	Eigen::BiCGSTAB<Eigen::SparseMatrix<float>> solver(A);
	Eigen::MatrixXf X = solver.solve(b);
	for (size_t i = 0; i < N; i++)
		OutputDebugString(((std::to_wstring(X(i, 0)) + L", " + std::to_wstring(X(i, 1)) + L"\n").c_str()));
	for (auto v : hemesh.Vertices()) {
		auto idx = hemesh.Index(v);
		v->uv[0] = X(idx, 0);
		v->uv[1] = X(idx, 1);
	}
	
	for (size_t i = 0; i < bunny->VertexNumber(); i++) {
		param_vertices[i].Pos.x = hemesh.Vertices().at(i)->uv[0];
		param_vertices[i].Pos.y = 0.f;
		param_vertices[i].Pos.z = hemesh.Vertices().at(i)->uv[1];

		param_vertices[i].Normal = { 0.f,1.f,0.f };

		param_vertices[i].TexC = hemesh.Vertices().at(i)->uv.as<XMFLOAT2>();
	}

	Ubpa::DX12::SubmeshGeometry bunnySubmesh;
	bunnySubmesh.IndexCount = bunny->indices.size() * 3;
	bunnySubmesh.StartIndexLocation = 0;
	bunnySubmesh.BaseVertexLocation = 0;
	Ubpa::DXRenderer::Instance()
		.RegisterStaticMeshGeometry(
			Ubpa::DXRenderer::Instance().GetUpload(), "orig_bunnyGeo",
			orig_vertices.data(), (UINT)orig_vertices.size(), sizeof(Vertex),
			indices.data(), (UINT)indices.size(), DXGI_FORMAT_R32_UINT)
		.submeshGeometries["bunny"] = bunnySubmesh;
	Ubpa::DXRenderer::Instance()
		.RegisterStaticMeshGeometry(
			Ubpa::DXRenderer::Instance().GetUpload(), "param_bunnyGeo",
			param_vertices.data(), (UINT)param_vertices.size(), sizeof(Vertex),
			indices.data(), (UINT)indices.size(), DXGI_FORMAT_R32_UINT)
		.submeshGeometries["bunny"] = bunnySubmesh;

	trimeshes.emplace("bunny", std::move(bunny));
}

void HW04App::BuildPSOs()
{
	auto screenPsoDesc = Ubpa::DX12::Desc::PSO::Basic(
		Ubpa::DXRenderer::Instance().GetRootSignature("screen"),
		nullptr, 0,
		Ubpa::DXRenderer::Instance().GetShaderByteCode("screenVS"),
		Ubpa::DXRenderer::Instance().GetShaderByteCode("screenPS"),
		mBackBufferFormat,
		DXGI_FORMAT_UNKNOWN
	);
	Ubpa::DXRenderer::Instance().RegisterPSO("screen", &screenPsoDesc);

	auto geometryPsoDesc = Ubpa::DX12::Desc::PSO::MRT(
		Ubpa::DXRenderer::Instance().GetRootSignature("geometry"),
		mInputLayout.data(), (UINT)mInputLayout.size(),
		Ubpa::DXRenderer::Instance().GetShaderByteCode("geometryVS"),
		Ubpa::DXRenderer::Instance().GetShaderByteCode("geometryPS"),
		3,
		DXGI_FORMAT_R32G32B32A32_FLOAT,
		mDepthStencilFormat
	);
	geometryPsoDesc.RasterizerState.FillMode = D3D12_FILL_MODE_WIREFRAME;
	Ubpa::DXRenderer::Instance().RegisterPSO("geometry", &geometryPsoDesc);

	auto deferLightingPsoDesc = Ubpa::DX12::Desc::PSO::Basic(
		Ubpa::DXRenderer::Instance().GetRootSignature("defer lighting"),
		nullptr, 0,
		Ubpa::DXRenderer::Instance().GetShaderByteCode("deferLightingVS"),
		Ubpa::DXRenderer::Instance().GetShaderByteCode("deferLightingPS"),
		mBackBufferFormat,
		DXGI_FORMAT_UNKNOWN
	);
	Ubpa::DXRenderer::Instance().RegisterPSO("defer lighting", &deferLightingPsoDesc);
}

void HW04App::BuildFrameResources()
{
    for(int i = 0; i < gNumFrameResources; ++i)
    {
		auto fr = std::make_unique<Ubpa::DX12::FrameResource>(mFence.Get());

		ID3D12CommandAllocator* allocator;
		ThrowIfFailed(uDevice->CreateCommandAllocator(
			D3D12_COMMAND_LIST_TYPE_DIRECT,
			IID_PPV_ARGS(&allocator)));

		fr->RegisterResource("CommandAllocator", allocator, [](void* allocator) {
			reinterpret_cast<ID3D12CommandAllocator*>(allocator)->Release();
		});

		fr->RegisterResource("gbPass constants",
			new Ubpa::DX12::ArrayUploadBuffer<PassConstants>{ uDevice.raw.Get(), 1, true });

		fr->RegisterResource("ArrayUploadBuffer<MaterialConstants>",
			new Ubpa::DX12::ArrayUploadBuffer<MaterialConstants>{ uDevice.raw.Get(), mMaterials.size(), true });

		fr->RegisterResource("ArrayUploadBuffer<ObjectConstants>",
			new Ubpa::DX12::ArrayUploadBuffer<ObjectConstants>{ uDevice.raw.Get(), mAllRitems.size(), true });

		auto fgRsrcMngr = new Ubpa::DX12::FG::RsrcMngr;
		fgRsrcMngr->Init(uGCmdList, uDevice);
		fr->RegisterResource("FrameGraphRsrcMngr", fgRsrcMngr);

		mFrameResources.emplace_back(std::move(fr));
    }
}

void HW04App::BuildMaterials()
{
	auto iron = std::make_unique<Material>();
	iron->Name = "iron";
	iron->MatCBIndex = 0;
	iron->DiffuseSrvGpuHandle = Ubpa::DXRenderer::Instance().GetTextureSrvGpuHandle("iron");
	iron->DiffuseAlbedo = XMFLOAT4(1.0f, 1.0f, 1.0f, 1.0f);
	iron->FresnelR0 = XMFLOAT3(0.05f, 0.05f, 0.05f);
	iron->Roughness = 0.2f;

	mMaterials["iron"] = std::move(iron);
}

void HW04App::BuildRenderItems()
{
	auto orig_bunnyRitem = std::make_unique<RenderItem>();
	orig_bunnyRitem->World = Ubpa::transformf(Ubpa::pointf3{ 1,0,0 }).as<XMFLOAT4X4>();
	orig_bunnyRitem->ObjCBIndex = 0;
	orig_bunnyRitem->Mat = mMaterials["iron"].get();
	orig_bunnyRitem->Geo = &Ubpa::DXRenderer::Instance().GetMeshGeometry("orig_bunnyGeo");
	orig_bunnyRitem->PrimitiveType = D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST;
	orig_bunnyRitem->IndexCount = orig_bunnyRitem->Geo->submeshGeometries["bunny"].IndexCount;
	orig_bunnyRitem->StartIndexLocation = orig_bunnyRitem->Geo->submeshGeometries["bunny"].StartIndexLocation;
	orig_bunnyRitem->BaseVertexLocation = orig_bunnyRitem->Geo->submeshGeometries["bunny"].BaseVertexLocation;
	mAllRitems.push_back(std::move(orig_bunnyRitem));

	auto param_bunnyRitem = std::make_unique<RenderItem>();
	param_bunnyRitem->World = Ubpa::transformf(Ubpa::pointf3{ -1,0,0 }).as<XMFLOAT4X4>();
	param_bunnyRitem->ObjCBIndex = 1;
	param_bunnyRitem->Mat = mMaterials["iron"].get();
	param_bunnyRitem->Geo = &Ubpa::DXRenderer::Instance().GetMeshGeometry("param_bunnyGeo");
	param_bunnyRitem->PrimitiveType = D3D11_PRIMITIVE_TOPOLOGY_TRIANGLELIST;
	param_bunnyRitem->IndexCount = param_bunnyRitem->Geo->submeshGeometries["bunny"].IndexCount;
	param_bunnyRitem->StartIndexLocation = param_bunnyRitem->Geo->submeshGeometries["bunny"].StartIndexLocation;
	param_bunnyRitem->BaseVertexLocation = param_bunnyRitem->Geo->submeshGeometries["bunny"].BaseVertexLocation;
	mAllRitems.push_back(std::move(param_bunnyRitem));

	// All the render items are opaque.
	for(auto& e : mAllRitems)
		mOpaqueRitems.push_back(e.get());
}

void HW04App::DrawRenderItems(ID3D12GraphicsCommandList* cmdList, const std::vector<RenderItem*>& ritems)
{
    UINT objCBByteSize = Ubpa::DX12::Util::CalcConstantBufferByteSize(sizeof(ObjectConstants));
    UINT matCBByteSize = Ubpa::DX12::Util::CalcConstantBufferByteSize(sizeof(MaterialConstants));
 
	auto objectCB = mCurrFrameResource
		->GetResource<Ubpa::DX12::ArrayUploadBuffer<ObjectConstants>>("ArrayUploadBuffer<ObjectConstants>")
		->GetResource();
	auto matCB = mCurrFrameResource
		->GetResource<Ubpa::DX12::ArrayUploadBuffer<MaterialConstants>>("ArrayUploadBuffer<MaterialConstants>")
		->GetResource();

    // For each render item...
    for(size_t i = 0; i < ritems.size(); ++i)
    {
        auto ri = ritems[i];

        cmdList->IASetVertexBuffers(0, 1, &ri->Geo->VertexBufferView());
        cmdList->IASetIndexBuffer(&ri->Geo->IndexBufferView());
        cmdList->IASetPrimitiveTopology(ri->PrimitiveType);

        D3D12_GPU_VIRTUAL_ADDRESS objCBAddress = objectCB->GetGPUVirtualAddress() + ri->ObjCBIndex*objCBByteSize;
		D3D12_GPU_VIRTUAL_ADDRESS matCBAddress = matCB->GetGPUVirtualAddress() + ri->Mat->MatCBIndex*matCBByteSize;

		cmdList->SetGraphicsRootDescriptorTable(0, ri->Mat->DiffuseSrvGpuHandle);
        cmdList->SetGraphicsRootConstantBufferView(1, objCBAddress);
        cmdList->SetGraphicsRootConstantBufferView(3, matCBAddress);

        cmdList->DrawIndexedInstanced(ri->IndexCount, 1, ri->StartIndexLocation, ri->BaseVertexLocation, 0);
    }
}

std::array<const CD3DX12_STATIC_SAMPLER_DESC, 6> HW04App::GetStaticSamplers()
{
	// Applications usually only need a handful of samplers.  So just define them all up front
	// and keep them available as part of the root signature.  

	const CD3DX12_STATIC_SAMPLER_DESC pointWrap(
		0, // shaderRegister
		D3D12_FILTER_MIN_MAG_MIP_POINT, // filter
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_WRAP); // addressW

	const CD3DX12_STATIC_SAMPLER_DESC pointClamp(
		1, // shaderRegister
		D3D12_FILTER_MIN_MAG_MIP_POINT, // filter
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP); // addressW

	const CD3DX12_STATIC_SAMPLER_DESC linearWrap(
		2, // shaderRegister
		D3D12_FILTER_MIN_MAG_MIP_LINEAR, // filter
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_WRAP); // addressW

	const CD3DX12_STATIC_SAMPLER_DESC linearClamp(
		3, // shaderRegister
		D3D12_FILTER_MIN_MAG_MIP_LINEAR, // filter
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP); // addressW

	const CD3DX12_STATIC_SAMPLER_DESC anisotropicWrap(
		4, // shaderRegister
		D3D12_FILTER_ANISOTROPIC, // filter
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_WRAP,  // addressW
		0.0f,                             // mipLODBias
		8);                               // maxAnisotropy

	const CD3DX12_STATIC_SAMPLER_DESC anisotropicClamp(
		5, // shaderRegister
		D3D12_FILTER_ANISOTROPIC, // filter
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressU
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressV
		D3D12_TEXTURE_ADDRESS_MODE_CLAMP,  // addressW
		0.0f,                              // mipLODBias
		8);                                // maxAnisotropy

	return { 
		pointWrap, pointClamp,
		linearWrap, linearClamp, 
		anisotropicWrap, anisotropicClamp };
}

