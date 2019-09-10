% alpha 是一维列向量或横向量，x 是一个数
% y(x) = \sum_{i=0}^{n-1} \alpha_i * x^i
function y = Polynomial(alpha, x)
	nX = size(x, 1);
	n = size(alpha, 1);
	y = zeros(nX, 1);
	xi = ones(nX, 1);
	for i = 1 : n,
		y += alpha(i) * xi;
		xi .*= x;
	end
end
