function b = ApproximationFourier(m, X, Y)
	n = size(X, 1);
	
	M = zeros(n, m+1);
	for i = 0 : m
		if mod(i, 2) == 0
			M(:, i+1) = M(:, i+1) + cos(i*pi*X);
        else
			M(:, i+1) = M(:, i+1) + sin((i+1)*pi*X);
		end
	end
	
	b = M' * M \ (M' * Y);
end
