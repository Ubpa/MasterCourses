function [mu, b0, b] = InterpolationGauss(X, Y)
	sigma = 1; % default
	
	b0 = mean(X);
	
	n = size(X, 1);
	
	mu = X;
	
	M = zeros(n);
	
	for i = 1 : n
		M(:, i) = exp(-power((X-mu(i)),2) / (2*power(sigma, 2)));
    end
	
    if cond(M) > 1e15 % 条件数过大
        b = pinv(M) * (Y - b0);
    else
        b = M \ (Y - b0); % M \ (Y - b0) == inv(M) * (Y - b0)
    end
end
