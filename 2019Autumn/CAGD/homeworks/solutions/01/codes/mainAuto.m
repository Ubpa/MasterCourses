close all;
clear variables;
clc;

% config
n = 100; % the amount of data points
m = 4; % the highest degree of approximation functions
noiseYScale = 0.1;

% data
step = 1.0 / n;
noiseX = rand(n, 1) * step;
X = step * (0 : (n-1))' + noiseX;

noiseY = noiseYScale * (2 * rand(n, 1) - 1);
Y = - 4 * (X.*X.*X) + 3 * (X.*X) - 2 * X + 1 + noiseY;

Fit(X, Y);
