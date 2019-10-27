function DrawBezierCurve(P, drawCtrl)
    if ~exist('drawCtrl', 'var') || isempty(drawCtrl)
        % drawCtrl 参数为空，或者不以变量的形式存在；
        drawCtrl= true;
    end
    
    n = 1000; % default

    % 绘制控制点和控制线
    if drawCtrl
        %plot(P(:,1), P(:,2), 'g.', 'MarkerSize', 32);
        plot(P(:,1), P(:,2), 'r', 'linewidth', 3);
    end
    
    % 计算 Bezier 曲线 Pt
    Pt = zeros(n, 2);
    t = (1/(n-1)) * (0:(n-1))';
    for i = 1:n
        Pt(i, :) = Bezier(P, t(i));
    end
    
    % 绘制 Bezier 曲线
    X = Pt(:, 1);
    Y = Pt(:, 2);
    plot(X, Y, 'c', 'linewidth', 3);
    
    %2
	p = zeros(3,2);
    p(1,:) = Bezier(P, 0);
    p(2,:) = Bezier(P, 0.5);
    p(3,:) = Bezier(P, 0.75);
    plot(p(:,1), p(:,2), 'b.', 'MarkerSize', 48);
    
    %3
    %left
    leftP = [2, 0;1, 1;1.25, 2;1.875, 2.375];
    plot(leftP(:,1), leftP(:, 2), 'g', 'lineWidth', 3);
    %right0
    right0 =[
        1.875,2.375;
        2.1875,2.5625;
        2.59375,2.59375;
        2.984375, 2.390625
        ];
    plot(right0(:,1), right0(:, 2), 'y', 'lineWidth', 3);
    %right1
    right1 =[
        2.984375, 2.390625;
        3.375,2.1875;
        3.75,1.75;
        4,1
        ];
    plot(right1(:,1), right1(:, 2), 'm', 'lineWidth', 3);
end
