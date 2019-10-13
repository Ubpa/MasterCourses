function alpha = ApproximationPolynomial(m, X, Y)
	n = size(X, 1);
	
    M = X .^ (0:(m-1));
	
	alpha = M' * M \ (M' * Y);
end
