function y = Fourier(b, x)
	n = size(x, 1);
	m = size(b, 1) - 1;
	
	y = zeros(n, 1);
	for i = 0 : m
		if mod(i, 2) == 0
			y = y + b(i+1) * cos(i*pi*x);
        else
			y = y + b(i+1) * sin((i+1)*pi*x);
		end
	end
end
