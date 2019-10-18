function rst = N(t, i, k, x)
    if k == 1
        if x < t(i) || x >= t(i+1)
            rst = 0;
        else
            rst = 1;
        end
    else
        if t(i+k-1) - t(i) == 0
            left = 0;
        else
            left = (x-t(i))/(t(i+k-1) - t(i)) * N(t, i, k-1, x);
        end
        
        if t(i + k) - t(i + 1) == 0
            right = 0;
        else
            right = (t(i + k) - x)/(t(i + k) - t(i+1)) * N(t, i+1, k-1, x);
        end
        
        rst = left + right;
    end
end