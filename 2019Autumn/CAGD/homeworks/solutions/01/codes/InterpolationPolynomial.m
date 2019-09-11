function alpha = InterpolationPolynomial(X, Y)
	n = size(X, 1);
	
	M = zeros(n);
	xi = ones(n, 1);
	for i = 1 : n
		M(:, i) = xi;
		xi = xi .* X;
    end
    
	if cond(M) > 1e15 % 条件数过大
        alpha = pinv(M) * Y;
    else
        alpha = M \ Y;
    end
end
