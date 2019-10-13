function y = Polynomial(alpha, x)
	n = size(alpha, 1);
    
	y = x .^ (0:(n-1)) * alpha;
end
