n = 50;
theta = 0:pi/n:pi;
phi = 0:2*pi/n:2*pi;
X = sin(theta)' * cos(phi);
Y = sin(theta)' * sin(phi);
Z = cos(theta)' * ones(1,size(X,2));
C = zeros(size(theta,2),size(phi,2),3);
for i=1:size(C,1)
	for j=1:size(C,2)
		C(i,j,:) = ([X(i,j),Y(i,j),Z(i,j)]+1)/2;
	end
end
surf(X,Y,Z,C);
shading interp;
