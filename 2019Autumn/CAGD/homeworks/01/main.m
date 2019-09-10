close all;
clc;

n = 10;

step = 1.0 / n;
noiseX = rand(n, 1) * step;
X = step * (0 : (n-1))' + noiseX;

noiseYScale = 0.1;
noiseY = noiseYScale * (2 * rand(n, 1) - 1);
Y = 3 * (X.*X) - 4 * X + 1 + noiseY;

figure 1;
hold on;

plot(X, Y, 'x');

uniformX = (min(X)-0.01) : 0.01 : (max(X) + 0.01);

alpha = InterpolationPolynomial(X, Y);
uniformY = Polynomial(alpha, uniformX);
plot(uniformX, uniformY);

predictY = Polynomial(alpha, X);
errorInterpolationPolynomial = SquareError(Y, predictY);

printf("Error of Interpolation Polynomial : %.12f\n", errorInterpolationPolynomial);

hold off;
