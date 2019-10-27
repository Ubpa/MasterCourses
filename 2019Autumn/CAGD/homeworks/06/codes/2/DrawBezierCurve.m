function DrawBezierCurve(P, drawCtrl)
    if ~exist('drawCtrl', 'var') || isempty(drawCtrl)
        % drawCtrl 参数为空，或者不以变量的形式存在；
        drawCtrl= true;
    end
    
    n = 1000; % default

    % 绘制控制点和控制线
    plot(P(:,1), P(:,2), 'm.', 'MarkerSize', 32);
    plot(P(:,1), P(:,2), 'm:', 'linewidth', 3);
    
    % 计算 Bezier 曲线 Pt
    Pt = zeros(n, 2);
    t = (1/(n-1)) * (0:(n-1))';
    for i = 1:n
        Pt(i, :) = Bezier(P, t(i));
    end
    
    % 绘制 Bezier 曲线
    X = Pt(:, 1);
    Y = Pt(:, 2);
    plot(X, Y, 'c', 'linewidth', 2);
    
    % 1
    P00=[-2,-10];
    P01=[-4,2];
    P02=[6,5];
    P03=[4,-7];
    P0 = [P00;P01;P02;P03];

    t10 = 0.5/3;
    t11 = 1.5/3;
    t12 = 2.5/3;

    t20 = 0.5/2;
    t21 = 1.5/2;

    t30 = 0.5/1;

    P10=t10*P00 + (1-t10)*P01;
    P11=t11*P01 + (1-t11)*P02;
    P12=t12*P02 + (1-t12)*P03;
    P1 = [P10;P11;P12];

    P20=t20*P10 + (1-t20)*P11;
    P21=t21*P11 + (1-t21)*P12;
    P2 = [P20;P21];

    P30=t30*P20 + (1-t30)*P21;

    plot(P0(:,1), P0(:,2), 'r:', 'linewidth', 3);
    plot(P0(:,1), P0(:,2), 'r.', 'markersize', 32);
    plot(P1(:,1), P1(:,2), 'g:', 'linewidth', 3);
    plot(P1(:,1), P1(:,2), 'g.', 'markersize', 32);
    plot(P2(:,1), P2(:,2), 'y:', 'linewidth', 3);
    plot(P2(:,1), P2(:,2), 'y.', 'markersize', 32);
    plot(P30(1), P30(2), 'c.', 'markersize', 32);
end
