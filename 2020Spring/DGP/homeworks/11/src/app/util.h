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

	template<typename T>
	bool IsConvexPolygon(const std::vector<point<T, 3>>& points) {
		assert(points.size() >= 4);
		std::vector<vec<T, 3>> vecs(points.size());
		std::vector<vec<T, 3>> norms(points.size());
		for (size_t i = 0; i < points.size(); i++) {
			size_t next = (i + 1) % points.size();
			vecs[i] = points[next] - points[i];
		}
		for (size_t i = 0; i < vecs.size(); i++) {
			size_t next = (i + 1) % points.size();
			norms[i] = vecs[i].cross(vecs[next]);
			for (size_t j = 0; j < i; j++) {
				if (norms[j].dot(norms[i]) < static_cast<T>(0))
					return false;
			}
		}
		return true;
	}
}
