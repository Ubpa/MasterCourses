#include "TriMesh.h"

#define TINYOBJLOADER_IMPLEMENTATION // define this in only *one* .cc
#include "_deps/tiny_obj_loader.h"

using namespace Ubpa;
using namespace std;

TriMesh::TriMesh(const vector<valu3>& indices,
	const vector<pointf3>& positions,
	const vector<pointf2>& texcoords,
	const vector<normalf>& normals,
	const vector<vecf3>& tangents)
{
	Init(indices, positions, texcoords, normals, tangents);
}

TriMesh::TriMesh(Type type) {
	switch (type)
	{
	case Ubpa::TriMesh::Type::Cube:
		InitCubeMesh();
		break;
	case Ubpa::TriMesh::Type::Sphere:
		InitSphereMesh();
		break;
	case Ubpa::TriMesh::Type::Square:
		InitSquareMesh();
		break;
	default:
		break;
	}
}

TriMesh::TriMesh(const string& path) {
	Init(path);
}

// center : (0, 0, 0), side length: 2
void TriMesh::InitCubeMesh() {
	const float data[264] = {
		// positions      // uv      // normals       // tangent
		-1.f, -1.f, -1.f, 1.f, 0.f,  0.f,  0.f, -1.f, -1.f,  0.f,  0.f,
		-1.f,  1.f, -1.f, 1.f, 1.f,  0.f,  0.f, -1.f, -1.f,  0.f,  0.f,
		 1.f, -1.f, -1.f, 0.f, 0.f,  0.f,  0.f, -1.f, -1.f,  0.f,  0.f,
		 1.f,  1.f, -1.f, 0.f, 1.f,  0.f,  0.f, -1.f, -1.f,  0.f,  0.f,

		-1.f, -1.f,  1.f, 0.f, 0.f,  0.f,  0.f,  1.f,  1.f,  0.f,  0.f,
		 1.f, -1.f,  1.f, 1.f, 0.f,  0.f,  0.f,  1.f,  1.f,  0.f,  0.f,
		-1.f,  1.f,  1.f, 0.f, 1.f,  0.f,  0.f,  1.f,  1.f,  0.f,  0.f,
		 1.f,  1.f,  1.f, 1.f, 1.f,  0.f,  0.f,  1.f,  1.f,  0.f,  0.f,

		-1.f, -1.f,  1.f, 1.f, 0.f, -1.f,  0.f,  0.f,  0.f,  0.f,  1.f,
		-1.f,  1.f,  1.f, 1.f, 1.f, -1.f,  0.f,  0.f,  0.f,  0.f,  1.f,
		-1.f, -1.f, -1.f, 0.f, 0.f, -1.f,  0.f,  0.f,  0.f,  0.f,  1.f,
		-1.f,  1.f, -1.f, 0.f, 1.f, -1.f,  0.f,  0.f,  0.f,  0.f,  1.f,

		 1.f,  1.f,  1.f, 0.f, 1.f,  1.f,  0.f,  0.f,  0.f,  0.f, -1.f,
		 1.f, -1.f,  1.f, 0.f, 0.f,  1.f,  0.f,  0.f,  0.f,  0.f, -1.f,
		 1.f,  1.f, -1.f, 1.f, 1.f,  1.f,  0.f,  0.f,  0.f,  0.f, -1.f,
		 1.f, -1.f, -1.f, 1.f, 0.f,  1.f,  0.f,  0.f,  0.f,  0.f, -1.f,

		 1.f, -1.f,  1.f, 1.f, 1.f,  0.f, -1.f,  0.f,  1.f,  0.f,  0.f,
		-1.f, -1.f,  1.f, 0.f, 1.f,  0.f, -1.f,  0.f,  1.f,  0.f,  0.f,
		 1.f, -1.f, -1.f, 1.f, 0.f,  0.f, -1.f,  0.f,  1.f,  0.f,  0.f,
		-1.f, -1.f, -1.f, 0.f, 0.f,  0.f, -1.f,  0.f,  1.f,  0.f,  0.f,

		-1.f,  1.f,  1.f, 0.f, 0.f,  0.f,  1.f,  0.f,  1.f,  0.f,  0.f,
		 1.f,  1.f,  1.f, 1.f, 0.f,  0.f,  1.f,  0.f,  1.f,  0.f,  0.f,
		-1.f,  1.f, -1.f, 0.f, 1.f,  0.f,  1.f,  0.f,  1.f,  0.f,  0.f,
		 1.f,  1.f, -1.f, 1.f, 1.f,  0.f,  1.f,  0.f,  1.f,  0.f,  0.f,
	};
	constexpr size_t n = 6;
	vector<valu3> indices(2 * n);
	for (size_t i = 0; i < n; i++) {
		auto offset = valu3{ static_cast<unsigned>(4 * i) };
		indices[2 * i] = offset + valu3{ 0,1,2 };
		indices[2 * i + 1] = offset + valu3{ 3,2,1 };
	}

	vector<pointf3> positions(4 * n);
	vector<pointf2> texcoords(4 * n);
	vector<normalf> normals(4 * n);
	vector<vecf3> tangents(4 * n);
	for (size_t i = 0; i < 4 * n; i++) {
		size_t offset = 11 * i;
		positions[i] = pointf3{ data[offset + 0],data[offset + 1],data[offset + 2] };
		texcoords[i] = pointf2{ data[offset + 3],data[offset + 4] };
		normals[i] = normalf{ data[offset + 5],data[offset + 6],data[offset + 7] };
		tangents[i] = vecf3{ data[offset + 8],data[offset + 9],data[offset + 10] };
	}

	Init(indices, positions, texcoords, normals, tangents);
}

// 50 x 50 grid
void TriMesh::InitSphereMesh() {
	size_t n = 50;
	size_t vertexNum = pow2(n + 1);
	size_t triNum = 2 * n * n;

	vector<pointf3> positions(vertexNum);
	vector<normalf> normals(vertexNum);
	vector<pointf2> texcoords(vertexNum);
	vector<valu3> indices(triNum);
	vector<vecf3> tangents(vertexNum);

	float inc = 1.f / n;
	for (size_t i = 0; i <= n; i++) {
		float u = inc * i;
		for (size_t j = 0; j <= n; j++) {
			float v = inc * j;
			float phi = 2 * PI<float> * u;
			float theta = PI<float> * (1 - v);

			float x = std::sin(theta) * std::sin(phi);
			float y = std::cos(theta);
			float z = std::sin(theta) * std::cos(phi);

			size_t idx = i * (n + 1) + j;
			positions[idx] = pointf3{ x,y,z };
			normals[idx] = normalf{ x,y,z };
			texcoords[idx] = pointf2{ u,v };
			tangents[idx] = vecf3{ std::cos(phi), 0, -std::sin(phi) };
		}
	}

	for (size_t i = 0; i < n; i++) {
		for (size_t j = 0; j < n; j++) {
			indices[2 * (i * n + j)] = valu3{
				(i + 1) * (n + 1) + j,
				i * (n + 1) + j,
				i * (n + 1) + j + 1,
			};

			indices[2 * (i * n + j) + 1] = valu3{
				i * (n + 1) + j + 1,
				(i + 1) * (n + 1) + j + 1,
				(i + 1) * (n + 1) + j,
			};
		}
	}

	Init(indices, positions, texcoords, normals, tangents);
}

// center : (0, 0, 0), side length: 2s
void TriMesh::InitSquareMesh() {
	vector<pointf3> positions = {
		pointf3{-1.f, 0.f,  1.f},
		pointf3{ 1.f, 0.f,  1.f},
		pointf3{ 1.f, 0.f, -1.f},
		pointf3{-1.f, 0.f, -1.f}
	};

	vector<valu3> indices = {
		valu3{0, 1, 2},
		valu3{3, 0, 2}
	};

	vector<pointf2> texcoords = {
		pointf2{0.f, 0.f},
		pointf2{1.f, 0.f},
		pointf2{1.f, 1.f},
		pointf2{0.f, 1.f}
	};

	vector<normalf> normals = {
		normalf{0.f, 1.f, 0.f},
		normalf{0.f, 1.f, 0.f},
		normalf{0.f, 1.f, 0.f},
		normalf{0.f, 1.f, 0.f},
	};

	Init(indices, positions, texcoords, normals);
}

bool TriMesh::Init(const string& path) {
	vector<valu3> indices;
	vector<pointf3> positions;
	vector<pointf2> texcoords;
	vector<normalf> normals;

	map<tuple<size_t, size_t, size_t>, size_t> vertexIndexMap;

	tinyobj::ObjReader objReader;
	tinyobj::ObjReaderConfig config;
	config.vertex_color = false;
	bool success = objReader.ParseFromFile(path, config);
	if (!success)
		return false;

	if (!objReader.Warning().empty()) {
		std::cout << objReader.Warning() << std::endl;
	}

	if (!objReader.Error().empty()) {
		std::cerr << objReader.Error() << std::endl;
	}

	if (!objReader.Valid()) {
		return false;
	}

	tinyobj::attrib_t attrib = objReader.GetAttrib();
	std::vector<tinyobj::shape_t> shapes = objReader.GetShapes();
	//std::vector<tinyobj::material_t> materials;

	// Loop over shapes
	for (size_t s = 0; s < shapes.size(); s++) {
		// Loop over faces(polygon)
		size_t index_offset = 0;
		for (size_t f = 0; f < shapes[s].mesh.num_face_vertices.size(); f++) {
			int fv = shapes[s].mesh.num_face_vertices[f];
			if (fv != 3)
				return false; // only support triangle mesh

			valu3 face;
			// Loop over vertices in the face.
			for (size_t v = 0; v < fv; v++) {
				// access to vertex
				tinyobj::index_t idx = shapes[s].mesh.indices[index_offset + v];

				auto key_idx = make_tuple(idx.vertex_index, idx.normal_index, idx.texcoord_index);
				auto target = vertexIndexMap.find(key_idx);
				if (target != vertexIndexMap.end()) {
					face[v] = static_cast<unsigned>(target->second);
					continue;
				}

				tinyobj::real_t vx = attrib.vertices[3 * idx.vertex_index + 0];
				tinyobj::real_t vy = attrib.vertices[3 * idx.vertex_index + 1];
				tinyobj::real_t vz = attrib.vertices[3 * idx.vertex_index + 2];
				positions.emplace_back(vx, vy, vz);
				if (idx.normal_index != -1) {
					tinyobj::real_t nx = attrib.normals[3 * idx.normal_index + 0];
					tinyobj::real_t ny = attrib.normals[3 * idx.normal_index + 1];
					tinyobj::real_t nz = attrib.normals[3 * idx.normal_index + 2];
					normals.emplace_back(nx, ny, nz);
				}
				if (idx.texcoord_index != -1) {
					tinyobj::real_t tx = attrib.texcoords[2 * idx.texcoord_index + 0];
					tinyobj::real_t ty = attrib.texcoords[2 * idx.texcoord_index + 1];
					texcoords.emplace_back(tx, ty);
				}
				// Optional: vertex colors
				// tinyobj::real_t red = attrib.colors[3*idx.vertex_index+0];
				// tinyobj::real_t green = attrib.colors[3*idx.vertex_index+1];
				// tinyobj::real_t blue = attrib.colors[3*idx.vertex_index+2];

				face[v] = static_cast<unsigned>(positions.size() - 1);
				vertexIndexMap[key_idx] = positions.size() - 1;
			}
			index_offset += fv;
			indices.push_back(face);
			// per-face material
			//shapes[s].mesh.material_ids[f];
		}
	}

	if (!Init(indices, positions, texcoords, normals))
		return false;

	return true;
}

bool TriMesh::Init(const vector<valu3>& indices,
	const vector<pointf3>& positions,
	const vector<pointf2>& texcoords,
	const vector<normalf>& normals,
	const vector<vecf3>& tangents)
{
	Clear();

	if (!(indices.size() > 0)
		|| positions.size() <= 0
		|| !normals.empty() && normals.size() != positions.size()
		|| !texcoords.empty() && texcoords.size() != positions.size()
		|| (tangents.size() != 0 && tangents.size() != positions.size()))
	{
		return false;
	}

	this->indices = indices;

	this->positions = positions;

	if (texcoords.empty()) {
		this->texcoords.resize(positions.size());
		pointf3 center = pointf3::combine(positions, 1.f / positions.size());
		for (size_t i = 0; i < positions.size(); i++)
			this->texcoords.at(i) = (positions[i] - center).normalize().cast_to<normalf>().to_sphere_texcoord();
	}
	else
		this->texcoords = texcoords;

	if (normals.empty())
		GenNormals();
	else
		this->normals = normals;

	if (tangents.size() == 0)
		GenTangents();
	else
		this->tangents = tangents;

	return true;
}

bool TriMesh::Empty() const noexcept {
	return indices.empty();
}

void TriMesh::Clear() {
	indices.clear();
	positions.clear();
	texcoords.clear();
	normals.clear();
	tangents.clear();
}

void TriMesh::GenNormals() {
	if (Empty())
		return;

	normals.clear();
	normals.resize(positions.size(), normalf(0.f));

	for (const auto& tri : indices) {
		auto v0 = tri[0];
		auto v1 = tri[1];
		auto v2 = tri[2];

		auto d10 = positions.at(v0) - positions.at(v1);
		auto d12 = positions.at(v2) - positions.at(v1);
		auto wN = d12.cross(d10).cast_to<normalf>();

		normals.at(v0) += wN;
		normals.at(v1) += wN;
		normals.at(v2) += wN;
	}

	for (auto& normal : normals)
		normal.normalize_self();
}

void TriMesh::GenTangents() {
	if (Empty())
		return;
	if (normals.empty())
		GenNormals();

	const size_t vertexNum = positions.size();
	const size_t triangleCount = indices.size() / 3;

	vector<vecf3> tanS(vertexNum);
	vector<vecf3> tanT(vertexNum);

	for (const auto& tri : indices) {
		auto i1 = tri[0];
		auto i2 = tri[1];
		auto i3 = tri[2];

		const pointf3& v1 = positions.at(i1);
		const pointf3& v2 = positions.at(i2);
		const pointf3& v3 = positions.at(i3);

		const pointf2& w1 = texcoords.at(i1);
		const pointf2& w2 = texcoords.at(i2);
		const pointf2& w3 = texcoords.at(i3);

		float x1 = v2[0] - v1[0];
		float x2 = v3[0] - v1[0];
		float y1 = v2[1] - v1[1];
		float y2 = v3[1] - v1[1];
		float z1 = v2[2] - v1[2];
		float z2 = v3[2] - v1[2];

		float s1 = w2[0] - w1[0];
		float s2 = w3[0] - w1[0];
		float t1 = w2[1] - w1[1];
		float t2 = w3[1] - w1[1];

		float denominator = s1 * t2 - s2 * t1;
		float r = denominator == 0.f ? 1.f : 1.f / denominator;
		vecf3 sdir((t2 * x1 - t1 * x2) * r, (t2 * y1 - t1 * y2) * r,
			(t2 * z1 - t1 * z2) * r);
		vecf3 tdir((s1 * x2 - s2 * x1) * r, (s1 * y2 - s2 * y1) * r,
			(s1 * z2 - s2 * z1) * r);

		tanS[i1] += sdir;
		tanS[i2] += sdir;
		tanS[i3] += sdir;
		tanT[i1] += tdir;
		tanT[i2] += tdir;
		tanT[i3] += tdir;
	}

	tangents.resize(vertexNum);
	for (size_t i = 0; i < vertexNum; i++) {
		const vecf3& n = normals.at(i).cast_to<vecf3>();
		const vecf3& t = tanS[i];

		// Gram-Schmidt orthogonalize
		auto projT = t - n * n.dot(t);
		tangents.at(i) = projT.norm2() == 0.f ? uniform_on_sphere<float>().cast_to<vecf3>() : projT.normalize();

		// Calculate handedness
		tangents.at(i) *= (n.cross(t).dot(tanT[i]) < 0.0F) ? -1.f : 1.f;
	}
}

bool TriMesh::Save(const std::string& path) {
	ofstream objFile(path);
	if (!objFile.is_open())
		return false;
	objFile << "# Created by UScene" << endl
		<< "# " << endl
		<< "# vertex: " << positions.size() << endl
		<< "# normal: " << normals.size() << endl
		<< "# texcoord: " << texcoords.size() << endl;

	for (const auto& pos : positions)
		objFile << "v " << pos[0] << " " << pos[1] << " " << pos[2] << endl;
	objFile << endl;

	for (const auto& n : normals)
		objFile << "vn " << n[0] << " " << n[1] << " " << n[2] << endl;
	objFile << endl;

	for (const auto& t : texcoords)
		objFile << "vt " << t[0] << " " << t[1] << endl;
	objFile << endl;

	for (auto tri : indices) {
		tri[0] += 1;
		tri[1] += 1;
		tri[2] += 1;
		objFile << "f "
			<< tri[0] << "/" << tri[0] << "/" << tri[0] << " "
			<< tri[1] << "/" << tri[1] << "/" << tri[1] << " "
			<< tri[2] << "/" << tri[2] << "/" << tri[2] << " " << endl;
	}
	objFile << endl;

	objFile.close();

	return true;
}

void TriMesh::ScaleToUnit() {
	bboxf3 b;
	for (const auto& pos : positions)
		b.combine_to_self(pos);

	auto c2o = -b.center().as<vecf3>();
	auto s = std::sqrt(3.f) / b.diagonal().norm();

	for (auto& pos : positions) {
		pos += c2o;
		pos[0] *= s;
		pos[1] *= s;
		pos[2] *= s;
	}
}
