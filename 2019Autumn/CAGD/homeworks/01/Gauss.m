% y(x) = b_0 + \sum_{i=1}^n b_i \exp^{-\frac{x-\mu_i}{2\sigma^2}}
function y = Gauss(mu, b, x)
	sigma = 1; % default
	
	b0 = mean(mu);
	n = size(b, 1);
	y = b0;
	% vectorize
	for i = 1 : n,
		y += b(i) * exp(- power(x - mu(i), 2)/(2 * power(sigma, 2)));
	end
end
