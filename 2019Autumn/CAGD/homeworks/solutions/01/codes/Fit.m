function Fit(X, Y)
    figure_FontSize=24;
    lineWidth = 3;

	figure();
    scrsz = get(0,'ScreenSize');
    set(gcf,'OuterPosition',scrsz);
    
	xlabel('x');
	ylabel('y');
	title('Four Fitting Methods');
	grid on;
    set(get(gca,'XLabel'),'FontSize',figure_FontSize,'Vertical','top');
    set(get(gca,'YLabel'),'FontSize',figure_FontSize,'Vertical','middle');
    set(findobj('FontSize',10),'FontSize',figure_FontSize);
    
	hold on;
	
	plot(X, Y, 'xr', 'MarkerSize', 10, 'LineWidth', 5,  'MarkerSize', 16);

	% config
	n = size(X, 1);
	m = min(4, n - 1);

	%uniformX = max(0,min(X)-0.01) : 0.01 : min(1,max(X)+0.01);
	uniformX = min(X) : 0.01 : max(X);

	% [1. interpolation]
	% [1.1 Polynomial] IP
	alpha_IP = InterpolationPolynomial(X, Y);

	% plot function
	uniformY_IP = Polynomial(alpha_IP, uniformX);
	plot(uniformX, uniformY_IP, 'r', 'LineWidth', lineWidth);

	% evaluate error
	predictY_IP = Polynomial(alpha_IP, X);
	error_IP = SquareError(Y, predictY_IP);

	fprintf("Error of Interpolation Polynomial : %16.12e\n", error_IP);

	% [1.2 Gauss] IG
	[mu, b0, b_IG] = InterpolationGauss(X, Y);

	% plot function
	uniformY_IG = Gauss(mu, b0, b_IG, uniformX);
	plot(uniformX, uniformY_IG, 'b', 'LineWidth', lineWidth);

	% evaluate error
	predictY_IG = Gauss(mu, b0, b_IG, X);
	error_IG = SquareError(Y, predictY_IG);

	fprintf("Error of Interpolation Gauss : %16.12e\n", error_IG);

	% [2. approximation]
	% [2.1 Polynomial]
	alpha_AP = ApproximationPolynomial(m, X, Y);

	% plot function
	uniformY_AP = Polynomial(alpha_AP, uniformX);
	plot(uniformX, uniformY_AP, 'Color', '#77AC30', 'LineWidth', lineWidth);

	% evaluate error
	predictY_AP = Polynomial(alpha_AP, X);
	error_AP = SquareError(Y, predictY_AP);

	fprintf("Error of Approximation Polynomial : %16.12e\n", error_AP);

	% [2.2 Fourier] AF
	b_AF = ApproximationFourier(m, X, Y);

	% plot function
	uniformY_AF = Fourier(b_AF, uniformX);
	plot(uniformX, uniformY_AF, 'Color', '#EDB120', 'LineWidth', lineWidth);

	% evaluate error
	predictY_AF = Fourier(b_AF, X);
	error_AF = SquareError(Y, predictY_AF);

	fprintf("Error of Approximation Fourier : %16.12e\n", error_AF);

	legend('data point','Interpolation Polynomial','Interpolation Gauss','Approximation Polynomial', 'Approximation Fourier');

	hold off;
end
