function rst = Bernstein(n, i, x)
    if i < 0 || i > n
        rst = 0;
    elseif n == 0
        rst = 1;
    else
        m = n - i + 1;
        Bx = (1-x).^(0:m-1);
        for j=1:i
            Bx(1) = x*Bx(1);
            for k = 2:m
                Bx(k) = (1-x)*Bx(k-1) + x*Bx(k);
            end
        end
        rst = Bx(m);
    end
end