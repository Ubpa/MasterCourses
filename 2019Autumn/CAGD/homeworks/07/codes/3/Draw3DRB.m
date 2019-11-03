function DrawRB(a, b, type)
% type
% 1: ellipse
% 2: hyperbola

if type == 1% 1: ellipse
    P = [
        a a 0
        0 b 2*b
        1 1 2
    ];
else % 2: hyperbola
    P = [
        a a 2*a
        0 b 2*b
        1 1 0
    ];
end

dualP=P;
dualP(:,2) = - dualP(:,2);

% bezier matrix
B = [
    1 0 0
    -2 2 0
    1 -2 1
];

% t
step = 0.001;
t1 = (0:step:1/3-0.0001)'.^(0:2);
nT1 = size(t1,1);
t2 = (1/3+0.0001:step:1)'.^(0:2);
nT2 = size(t2,1);
t = [t1;t2];

% x
x_3D = t * B * P';
x = x_3D./x_3D(:,3);

plot3(x(1:nT1,1),x(1:nT1,2),x(1:nT1,3), 'c', 'linewidth', 2);
plot3(x(nT1+(1:nT2),1),x(nT1+(1:nT2),2),x(nT1+(1:nT2),3), 'c', 'linewidth', 2);

plot3(x_3D(1:nT1,1),x_3D(1:nT1,2),x_3D(1:nT1,3), 'r', 'linewidth', 2);
plot3(x_3D(nT1+(1:nT2),1),x_3D(nT1+(1:nT2),2),x_3D(nT1+(1:nT2),3), 'r', 'linewidth', 2);

% dual x
dualX_3D = t * B * dualP';
dualX = dualX_3D./dualX_3D(:,3);

plot3(dualX(1:nT1,1),dualX(1:nT1,2),dualX(1:nT1,3), 'c', 'linewidth', 2);
plot3(dualX(nT1+(1:nT2),1),dualX(nT1+(1:nT2),2),dualX(nT1+(1:nT2),3), 'c', 'linewidth', 2);

plot3(dualX_3D(1:nT1,1),dualX_3D(1:nT1,2),dualX_3D(1:nT1,3), 'r', 'linewidth', 2);
plot3(dualX_3D(nT1+(1:nT2),1),dualX_3D(nT1+(1:nT2),2),dualX_3D(nT1+(1:nT2),3), 'r', 'linewidth', 2);

end