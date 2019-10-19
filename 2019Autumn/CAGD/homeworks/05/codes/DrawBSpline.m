function DrawBSpline(p, isDrawCtrl)
nP = size(p,1);

% gen k s
k = zeros(3*nP,3);%第三维用来标识直线的首或尾
s = zeros(3*nP,1);
i = 1;
idx = 1;
while i <= nP
    if p(i,3) == 2 && i ~= nP && p(i+1,3) == 2% 直线
        k(idx,:) = [p(i,1:2), 0];
        k(idx+1,:) = [p(i,1:2), 1]; % 直线首
        s(idx:idx+1) = repmat(i-1, [2,1]);
        idx = idx + 2;
        while i+2 <= nP && p(i+2, 3) == 2 % 直线中部
            i = i+1;
            k(idx:idx+2,:) = repmat([p(i,1:2),0], [3,1]);
            s(idx:idx+2) = repmat(i-1, [3,1]);
            idx = idx + 3;
        end
        i = i+1;
        k(idx,:) = [p(i,1:2), 1]; % 直线尾
        k(idx+1,:) = [p(i,1:2), 0];
        s(idx:idx+1) = repmat(i-1, [2,1]);
        idx = idx + 2;
    elseif p(i,3) == 3 % 尖点
        k(idx:idx+2,:) = repmat([p(i,1:2),0], [3,1]);
        s(idx:idx+2) = repmat(i-1, [3,1]);
        idx = idx + 3;
    else % C2
        k(idx,:) = [p(i,1:2), 0];
        s(idx) = i-1;
        idx = idx + 1;
    end
    i = i +1;
end
k = k(1:idx-1,:);
s = s(1:idx-1);

% compute de Boor points
d = DeBoorPoints(k, s);

% draw B-Spline
if size(d,1)>2
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