function DrawBezierCurve(P, drawCtrl)
    if ~exist('drawCtrl', 'var') || isempty(drawCtrl)
        % drawCtrl ����Ϊ�գ����߲��Ա�������ʽ���ڣ�
        drawCtrl= true;
    end
    
    n = 100; % default

    % ���ƿ��Ƶ�Ϳ�����
    if drawCtrl
        plot(P(:,1), P(:,2), 'g.', 'MarkerSize', 32);
        plot(P(:,1), P(:,2), 'b', 'linewidth', 2);
    end
    
    % ���� Bezier ���� Pt
    Pt = zeros(n, 2);
    t = (1/(n-1)) * (0:(n-1))';
    for i = 1:n
        Pt(i, :) = Bezier(P, t(i));
    end
    
    % ���� Bezier ����
    X = Pt(:, 1);
    Y = Pt(:, 2);
    plot(X, Y, 'c', 'linewidth', 2);
end
