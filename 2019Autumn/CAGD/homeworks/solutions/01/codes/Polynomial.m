function y = Polynomial(alpha, x)
	nX = size(x, 1);
	n = size(alpha, 1);
	y = zeros(nX, 1);
	xi = ones(nX, 1);
	for i = 1 : n
		y = y + alpha(i) * xi;
		xi = xi .* x;
	end
end
