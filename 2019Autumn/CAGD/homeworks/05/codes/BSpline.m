function rst = BSpline(s, d, x)
    if x >= s(size(s,1))
        rst = d(size(d,1), :);
        return;
    end
    
    % binary serach
    left = 1; % s(left) <= x
    right = size(s,1); % s(right) > x
    while right - left > 1
        m = fix((left + right)/2);
        if s(m) <= x
            left = m;
            continue;
        else
            right = m;
            continue;
        end
    end
    
    % extent t
    t = [s(1); s(1); s(1); s; s(size(s,1)); s(size(s,1)); s(size(s,1))];
    
% 	idx = left;
%     c1 = N(t, idx, 4, x);
%     c2 = N(t, idx+1, 4, x);
%     c3 = N(t, idx+2, 4, x);
%     c4 = N(t, idx+3, 4, x);
%     rst = c1 * d(idx, :) + c2 * d(idx+1,:) + c3 * d(idx+2, :) + c4 * d(idx+3, :);
    
    curN = zeros(7,1);
    for i = 1:7
    	curN(i) = N(t,left+i-1,1,x);
    end
    for i =2:4 % k
        for j = 1:8-i
            idx = left + j -1;
            if t(idx+i-1) - t(idx) == 0
                l = 0;
            else
                l = (x-t(idx))/(t(idx+i-1) - t(idx)) * curN(j);
            end

            if t(idx + i) - t(idx + 1) == 0
                r = 0;
            else
                r = (t(idx + i) - x)/(t(idx + i) - t(idx+1)) * curN(j+1);
            end

            curN(j) = l + r;
        end
    end
    rst = curN(1) * d(left, :) + curN(2) * d(left+1,:) + curN(3) * d(left+2, :) + curN(4) * d(left+3, :);
    
end