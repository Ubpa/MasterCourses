function alpha = InterpolationPolynomial(X, Y)
	n = size(X, 1);
	
	%M = fliplr(vander(X));
	M = X .^ (0:(n-1));
    
    alpha = pinv(M) * Y;
end
