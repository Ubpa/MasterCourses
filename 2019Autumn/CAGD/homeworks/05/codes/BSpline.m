function rst = BSpline(s, d, x)
    if x >= s(size(s,1))
        rst = d(size(d,1), :);
        return;
    end

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
    i = left;
%     if i == size(s,1)
%         rst = d(size(d,1),:);
%         return;
%     end
    
    c1 = N(t, i, 4, x);
    c2 = N(t, i+1, 4, x);
    c3 = N(t, i+2, 4, x);
    c4 = N(t, i+3, 4, x);
    rst = c1 * d(i, :) + c2 * d(i+1,:) + c3 * d(i+2, :) + c4 * d(i+3, :);
end