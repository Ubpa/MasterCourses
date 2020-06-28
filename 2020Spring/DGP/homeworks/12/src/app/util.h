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
	template<typename T>
	bool IsConvexPolygon(const std::vector<point<T, 2>>& points) {
		std::vector<point<T, 3>> expandPoints;
		for (const auto& p : points)
			expandPoints.emplace_back(p[0], p[1], ZERO<T>);
		return IsConvexPolygon(expandPoints);
	}

	/*****************************************************************************/
	/*****************************************************************************/
	/*                                                                           */
	/*  tricircumcenter()   Find the circumcenter of a triangle.                 */
	/*                                                                           */
	/*  The result is returned both in terms of x-y coordinates and xi-eta       */
	/*  coordinates, relative to the triangle's point `a' (that is, `a' is       */
	/*  the origin of both coordinate systems).  Hence, the x-y coordinates      */
	/*  returned are NOT absolute; one must add the coordinates of `a' to        */
	/*  find the absolute coordinates of the circumcircle.  However, this means  */
	/*  that the result is frequently more accurate than would be possible if    */
	/*  absolute coordinates were returned, due to limited floating-point        */
	/*  precision.  In general, the circumradius can be computed much more       */
	/*  accurately.                                                              */
	/*                                                                           */
	/*  The xi-eta coordinate system is defined in terms of the triangle.        */
	/*  Point `a' is the origin of the coordinate system.  The edge `ab' extends */
	/*  one unit along the xi axis.  The edge `ac' extends one unit along the    */
	/*  eta axis.  These coordinate values are useful for linear interpolation.  */
	/*                                                                           */
	/*  If `xi' is NULL on input, the xi-eta coordinates will not be computed.   */
	/*                                                                           */
	/*****************************************************************************/


	/*****************************************************************************/
	inline void tricircumcenter(const float a[2], const float b[2], const float c[2], float circumcenter[2],
		float* xi = nullptr, float* eta = nullptr)
	{
		float xba, yba, xca, yca;
		float balength, calength;
		float denominator;
		float xcirca, ycirca;

		/* Use coordinates relative to point `a' of the triangle. */
		xba = b[0] - a[0];
		yba = b[1] - a[1];
		xca = c[0] - a[0];
		yca = c[1] - a[1];
		/* Squares of lengths of the edges incident to `a'. */
		balength = xba * xba + yba * yba;
		calength = xca * xca + yca * yca;

		/* Calculate the denominator of the formulae. */
		/* Take your chances with floating-point roundoff. */
		denominator = 0.5 / (xba * yca - yba * xca);

		/* Calculate offset (from `a') of circumcenter. */
		xcirca = (yca * balength - yba * calength) * denominator;
		ycirca = (xba * calength - xca * balength) * denominator;
		circumcenter[0] = xcirca;
		circumcenter[1] = ycirca;

		if (xi != nullptr) {
			/* To interpolate a linear function at the circumcenter, define a     */
			/*   coordinate system with a xi-axis directed from `a' to `b' and    */
			/*   an eta-axis directed from `a' to `c'.  The values for xi and eta */
			/*   are computed by Cramer's Rule for solving systems of linear      */
			/*   equations.                                                       */
			*xi = (xcirca * yca - ycirca * xca) * (2.0 * denominator);
			*eta = (ycirca * xba - xcirca * yba) * (2.0 * denominator);
		}
	}

	void TriCircumCenter2D(const float a[2], const float b[2], const float c[2], float result[2],
		float* param = nullptr)
	{
		tricircumcenter(a, b, c, result, &param[0], &param[1]);

		result[0] += a[0];
		result[1] += a[1];
	}
}
