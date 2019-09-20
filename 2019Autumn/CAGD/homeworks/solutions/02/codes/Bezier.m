function Pt = Bezier(P, t)
    n = size(P, 1) - 1;
    if n == -1
        Pt = zeros(1, 2);
        return;
    end
    
    b = P;
    for r = 1 : n
        for i = 1 : (n-r+1)
            b(i, :) = (1-t) * b(i, :) + t * b(i+1, :);
        end
    end
    Pt = b(1, :);
end
