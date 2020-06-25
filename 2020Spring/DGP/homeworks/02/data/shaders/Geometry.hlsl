//***************************************************************************************
// Default.hlsl by Frank Luna (C) 2015 All Rights Reserved.
//
// Default shader, currently supports lighting.
//***************************************************************************************

// Defaults for number of lights.
#ifndef NUM_DIR_LIGHTS
    #define NUM_DIR_LIGHTS 3
#endif

#ifndef NUM_POINT_LIGHTS
    #define NUM_POINT_LIGHTS 0
#endif

#ifndef NUM_SPOT_LIGHTS
    #define NUM_SPOT_LIGHTS 0
#endif

// Include structures and functions for lighting.
#include "LightingUtil.hlsl"

Texture2D    gAlbedoMap    : register(t0);
Texture2D    gRoughnessMap : register(t1);
Texture2D    gMetalnessMap : register(t2);

SamplerState gsamLinear  : register(s0);


// Constant data that varies per frame.
cbuffer cbPerObject : register(b0)
{
    float4x4 gWorld;
    float4x4 gTexTransform;
};

// Constant data that varies per material.
cbuffer cbPass : register(b1)
{
    float4x4 gView;
    float4x4 gInvView;
    float4x4 gProj;
    float4x4 gInvProj;
    float4x4 gViewProj;
    float4x4 gInvViewProj;
    float3 gEyePosW;
    float cbPerObjectPad1;
    float2 gRenderTargetSize;
    float2 gInvRenderTargetSize;
    float gNearZ;
    float gFarZ;
    float gTotalTime;
    float gDeltaTime;
    float4 gAmbientLight;

    // Indices [0, NUM_DIR_LIGHTS) are directional lights;
    // indices [NUM_DIR_LIGHTS, NUM_DIR_LIGHTS+NUM_POINT_LIGHTS) are point lights;
    // indices [NUM_DIR_LIGHTS+NUM_POINT_LIGHTS, NUM_DIR_LIGHTS+NUM_POINT_LIGHT+NUM_SPOT_LIGHTS)
    // are spot lights for a maximum of MaxLights per object.
    Light gLights[MaxLights];
};

cbuffer cbMaterial : register(b2)
{
	float4 gDiffuseAlbedo;
    float3 gFresnelR0;
    float  gRoughness;
    float4x4 gMatTransform;
};

struct VertexIn
{
	float3 PosL    : POSITION;
    float3 NormalL : NORMAL;
	float2 TexC    : TEXCOORD0;
	
	// float average_curvature;
	// float abs_average_curvature;
	// float gauss_curvature;
	float3 data    : TEXCOORD1;
};

struct VertexOut
{
	float4 PosH    : SV_POSITION;
    float3 PosW    : POSITION;
    float3 NormalW : NORMAL;
	float2 TexC    : TEXCOORD0;
	float3 data    : TEXCOORD1;
};

VertexOut VS(VertexIn vin)
{
	VertexOut vout = (VertexOut)0.0f;
	
    // Transform to world space.
    float4 posW = mul(float4(vin.PosL, 1.0f), gWorld);
    vout.PosW = posW.xyz;

    // Assumes nonuniform scaling; otherwise, need to use inverse-transpose of world matrix.
    vout.NormalW = mul(vin.NormalL, (float3x3)gWorld);

    // Transform to homogeneous clip space.
    vout.PosH = mul(posW, gViewProj);
	
	// Output vertex attributes for interpolation across triangle.
    float4 texC = mul(float4(vin.TexC, 0.0f, 1.0f), gTexTransform);
    vout.TexC = mul(texC, gMatTransform).xy;
	
	vout.data = vin.data;

    return vout;
}

struct PixelOut
{
	float4 gbuffer0    : SV_Target0;
	float4 gbuffer1    : SV_Target1;
	float4 gbuffer2    : SV_Target2;
};

static const float3 colorbar[11] =
{
    float3(0.00f, 0.00f, 0.64f),
    float3(0.00f, 0.16f, 1.00f),
    float3(0.00f, 0.69f, 1.00f),
    float3(0.05f, 0.96f, 0.92f),
    float3(0.49f, 1.00f, 0.48f),
    float3(0.71f, 1.00f, 0.26f),
    float3(0.92f, 1.00f, 0.05f),
    float3(1.00f, 0.77f, 0.00f),
    float3(0.94f, 0.03f, 0.00f),
    float3(0.64f, 0.00f, 0.00f),
    float3(0.20f, 0.00f, 0.00f)
};

PixelOut PS(VertexOut pin)
{
	PixelOut pout;
	
	uint z = (uint)(10.f * pin.data.z);
	float3 color = lerp(colorbar[z], colorbar[z+1], 10.f * pin.data.z - z);
	
    float3 albedo = color; //float3(pin.data.z, pin.data.z, pin.data.z);// * gAlbedoMap.Sample(gsamLinear, pin.TexC).xyz;
    float roughness = 0.5f;//gRoughnessMap.Sample(gsamLinear, pin.TexC).x;
    float metalness = 0.f;//gMetalnessMap.Sample(gsamLinear, pin.TexC).x;
	
	pout.gbuffer0 = float4(albedo, roughness);
	pout.gbuffer1 = float4(normalize(pin.NormalW), metalness);
	pout.gbuffer2 = float4(pin.PosW, 0.0f);
	
	return pout;
}
