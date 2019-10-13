function [X, Y] = Ellipse(a, b, t)
	cosT = cos(t);
	sinT = sin(t);
	X = a * cosT;
	Y = b * sinT;
end
