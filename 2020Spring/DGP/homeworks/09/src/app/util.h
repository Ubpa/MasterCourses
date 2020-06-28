#pragma once

#include "../trimesh/TriMesh.h"
#include <UHEMesh/HEMesh.h>

#include <DirectXMath.h>

namespace Ubpa {
	template<>
	struct ImplTraits<DirectX::XMFLOAT4>
		: Array1DTraits<float, 4> {};
	template<>
	struct ImplTraits<DirectX::XMFLOAT3>
		: Array1DTraits<float, 3> {};
	template<>
	struct ImplTraits<DirectX::XMFLOAT2>
		: Array1DTraits<float, 2> {};
	template<>
	struct ImplTraits<DirectX::XMFLOAT4X4>
		: ArrayTraits<DirectX::XMFLOAT4, 4, float> {};

	float GaussNoise(float mean, float stddev);

	float gauss(float mean, float stddev, float x);
}
