function DrawBezierCurve(P, drawCtrl)
    if ~exist('drawCtrl', 'var') || isempty(drawCtrl)
        % drawCtrl 参数为空，或者不以变量的形式存在；
        drawCtrl= true;
    end
    
    n = 100; % default

    % 绘制控制点和控制线
    if drawCtrl
        plot(P(:,1), P(:,2), 'g.', 'MarkerSize', 32);
        plot(P(:,1), P(:,2), 'b', 'linewidth', 2);
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
    plot(X, Y, 'c', 'linewidth', 2);
end
