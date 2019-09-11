function y = Gauss(mu, b0, b, x)
	sigma = 1; % default
	
	n = size(b, 1);
	nX = size(x, 1);
	y = b0 * ones(nX, 1);
	
	% vectorize
	for i = 1 : n
		y = y + b(i) * exp(- power(x - mu(i), 2)./(2 * power(sigma, 2)));
	end
end
