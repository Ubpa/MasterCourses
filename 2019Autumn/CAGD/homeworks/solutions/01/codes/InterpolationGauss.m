function [mu, b0, b] = InterpolationGauss(X, Y)
	sigma = 1; % default
	
	b0 = mean(X);
	
	n = size(X, 1);
	
	mu = X;
	
    muMat = ones(n, 1) * mu';
    M = exp(-power(X - muMat, 2) / (2*power(sigma, 2)));
    
    b = pinv(M) * (Y - b0);
end
