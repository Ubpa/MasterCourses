function alpha = InterpolationPolynomial(X, Y)
	n = size(X, 1);
	
	M = zeros(n);
	xi = ones(n, 1);
	for i = 1 : n,
		M(:, i) = xi;
		xi .*= X;
	end
	
	alpha = M \ Y; % M \ Y == inv(M) * Y
end
