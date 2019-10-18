function DrawBSpline(p, isDrawCtrl)

nP = size(p,1);

% expand
k = zeros(0,3);%第三维用来标识直线的首或尾
s = zeros(0,1);
i = 1;
while i <= nP
    if p(i,3) == 2 && i ~= nP && p(i+1,3) == 2% 直线
        k = [k;p(i,1:2), 0];
        k = [k;p(i,1:2), 1]; % 直线首
        s = [s; repmat(i-1, [2,1])];
        while i+2 <= nP && p(i+2, 3) == 2 % 直线
            i = i+1;
            k = [k; repmat([p(i,1:2),0], [3,1])];
            s = [s; repmat(i-1, [3,1])];
        end
        i = i+1;
        k = [k; p(i,1:2), 1]; % 直线尾
        k = [k; p(i,1:2), 0];
        s = [s; repmat(i-1, [2,1])];
    elseif p(i,3) == 3 % 尖点
        k = [k; repmat([p(i,1:2),0], [3,1])];
        s = [s; repmat(i-1, [3,1])];
    else % C2
        k = [k; p(i,1:2), 0];
        s = [s;i-1];
    end
    i = i +1;
end
d = DeBoorPoints(k, s);

% draw B-Spline
if size(d,1)>2
    sX = (s(1):0.01:s(size(s,1)))';
    sN = size(sX, 1);
    sY = zeros(sN, 2);
    for i = 1: sN
        sY(i,:) = BSpline(s, d, sX(i));
    end

    plot(sY(:,1), sY(:,2), 'LineWidth', 3);
end

% draw ctrl
if isDrawCtrl
    config = ['r.';'g.';'b.'];
    for i = 1:nP
        plot(p(i,1), p(i,2), config(p(i,3),:), 'MarkerSize', 32);
    end
    
    plot(d(:,1),d(:,2),'c--');
    
     for i = 1:size(d,1)
         plot(d(i,1),d(i,2), 'c.', 'MarkerSize', 16);
     end
end
