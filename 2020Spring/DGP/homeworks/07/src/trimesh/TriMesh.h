#pragma once

#include <UGM/UGM.h>

#include <vector>
#include <string>

namespace Ubpa {
	class TriMesh {
	public:
		std::vector<valu3> indices; // unsigned is for OpenGL
		std::vector<pointf3> positions;
		std::vector<pointf2> texcoords;
		std::vector<normalf> normals;
		std::vector<vecf3> tangents;

		TriMesh() = default;

		TriMesh(const std::vector<valu3>& indices,
			const std::vector<pointf3>& positions,
			const std::vector<pointf2>& texcoords = std::vector<pointf2>(),
			const std::vector<normalf>& normals = std::vector<normalf>(),
			const std::vector<vecf3>& tangents = std::vector<vecf3>());

		enum class Type { Cube, Sphere, Square };
		TriMesh(Type type);

		TriMesh(const std::string& path);

		// center : (0, 0, 0), side length: 2
		void InitCubeMesh();
		// 50 x 50 grid
		void InitSphereMesh();
		// center : (0, 0, 0), side length: 2, normal: (0, 1, 0)
		void InitSquareMesh();

		bool Init(const std::vector<valu3>& indices,
			const std::vector<pointf3>& positions,
			const std::vector<pointf2>& texcoords = std::vector<pointf2>(),
			const std::vector<normalf>& normals = std::vector<normalf>(),
			const std::vector<vecf3>& tangents = std::vector<vecf3>());

		bool Init(const std::string& path);

		// .obj
		bool Save(const std::string& path);

		bool Empty() const noexcept;

		size_t VertexNumber() const noexcept { return positions.size(); }
		size_t TriangleNumber() const noexcept { return indices.size(); }

		void Clear();

		void GenTexcoords();
		void GenNormals();
		void GenTangents();

		void ScaleToUnit();
		void CombineSamePositionVertex();
	};
}
