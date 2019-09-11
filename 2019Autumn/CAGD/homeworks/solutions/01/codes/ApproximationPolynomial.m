function alpha = ApproximationPolynomial(m, X, Y)
	n = size(X, 1);
	
	M = zeros(n, m);
	xi = ones(n, 1);
	for i = 1 : m
		M(:, i) = xi;
		xi = xi .* X;
	end
	
	alpha = M' * M \ (M' * Y);
end
