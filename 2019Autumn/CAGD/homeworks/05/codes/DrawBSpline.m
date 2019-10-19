function DrawBSpline(p, isDrawCtrl)
if size(p,1) == 0
    return;
end

% compute de Boor points
[d, s] = DeBoorPoints(p);

%draw B-Spline
if size(d,1)> 2
    sX = (s(1):0.05:s(size(s,1)))';
    sN = size(sX, 1);
    sY = zeros(sN, 2);
    for i = 1: sN
        sY(i,:) = BSpline(s, d, sX(i));
    end
    
    plot(sY(:,1), sY(:,2), 'LineWidth', 2);
end

% draw ctrl
if isDrawCtrl
    rR = p(:,3)==1;
    gR = p(:,3)==2;
    bR = p(:,3)==3;
    plot(p(rR,1), p(rR,2), 'r.', 'MarkerSize', 32);
    plot(p(gR,1), p(gR,2), 'g.', 'MarkerSize', 32);
    plot(p(bR,1), p(bR,2), 'b.', 'MarkerSize', 32);
    
    plot(d(:,1),d(:,2),'c--');
    plot(d(:,1),d(:,2), 'c.', 'MarkerSize', 16);
end