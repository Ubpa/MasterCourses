function DrawBSpline(p, isDrawCtrl)

nP = size(p,1);

% expand
k = zeros(sum(p(:,3)), 2);
s = zeros(sum(p(:,3)), 1);
curIdx = 1;
for i = 1 : nP
    m = p(i,3); % multiplicity
    k(curIdx : (curIdx+m-1), :) = repmat(p(i,1:2),[m,1]);
    s(curIdx : (curIdx+m-1)) = repmat(i-1,[m,1]);
    curIdx = curIdx + m;
end

d = DeBoorPoints(k, s);

if size(d,1)>2
    sX = (s(1):0.01:s(size(s,1)))';
    sN = size(sX, 1);
    sY = zeros(sN, 2);
    for i = 1: sN
        sY(i,:) = BSpline(s, d, sX(i));
    end

    plot(sY(:,1), sY(:,2));
end

% draw ctrl
if isDrawCtrl
    config = ['r.';'g.';'b.'];
    for i = 1:nP
        plot(p(i,1), p(i,2), config(p(i,3),:), 'MarkerSize', 32);
    end
    
    plot(d(:,1),d(:,2),'c');
     for i = 1:size(d,1)
         plot(d(i,1),d(i,2), 'c.', 'MarkerSize', 32);
     end
end
