function rst = SquareError(Y, predict_Y)
	rst = sum((Y - predict_Y).^2);
end
