clc;
close all;

figure(1);
hold on;

v = 1;
R = 3;
r = 1;
theta0 = pi;

theta = 0:0.01:(2*pi);
plot(R*cos(theta),R*sin(theta));
plot(R+r+r*cos(theta),r*sin(theta));

maxT = 2 * pi * R / v;
t = 0:0.001:maxT;

px = (R+r)*cos(v*t/R)+r*cos(theta0 + v*t/r+v*t/R);
py = (R+r)*sin(v*t/R)+r*sin(theta0 + v*t/r+v*t/R);

plot(px, py);
hold off;
