#include "util.h"

#include <random>

using namespace Ubpa;

namespace Ubpa {
	static std::default_random_engine rnd;
}

float Ubpa::GaussNoise(float mean, float stddev) {
	std::normal_distribution<float> distribution(mean, stddev);
	return distribution(rnd);
}

float Ubpa::gauss(float mean, float stddev, float x) {
	return std::exp(-Ubpa::pow2(x - mean) / (2 * Ubpa::pow2(stddev)));
}
