function [X, Y, R] = Evolute(a, b, t)
	cosT = cos(t);
	sinT = sin(t);
	
	m = a^2*(sinT.^2) + b^2*(cosT.^2);
    
	X = (a - m/a) .* cosT;
	Y = (b - m/b) .* sinT;
    R = (m.^1.5) / (a*b);
end
