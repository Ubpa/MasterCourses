function y = Gauss(mu, b0, b, x)
	sigma = 1; % default
    
	nX = size(x, 1);
    
    muMat = ones(nX, 1) * mu';
    y = b0 + exp(-power(x - muMat, 2) ./ (2 * power(sigma, 2))) * b;
end
