function DrawEvolute(e)
    a = 1;
    c = a * e;
    b = sqrt(a*a - c*c);

    % plot ellipse
    t = 0:0.01:(2*pi);
    [ellipseX, ellipseY] = Ellipse(a, b, t);
    plot(ellipseX, ellipseY, 'm', 'lineWidth', 4);

    % plot evolute
    [evoluteX, evoluteY] = Evolute(a, b, t);
    plot(evoluteX, evoluteY, 'c', 'lineWidth', 2);

    % plot osculating circle
    pt = 2 * pi * [0.25;0.5;0.875];
    [eX, eY] = Ellipse(a,b,pt);
    [cX, cY, cR] = Evolute(a, b, pt);
    colors = ['r','b','g'];

    for i = 1:3
        plot(eX(i), eY(i), [colors(i),'.'], 'markersize', 32);
        plot(cX(i), cY(i), [colors(i),'.'], 'markersize', 32);
        plot(cX(i)+cR(i)*cos(t), cY(i)+cR(i)*sin(t), colors(i), 'lineWidth', 2);
    end

