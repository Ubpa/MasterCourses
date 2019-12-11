function rst = T(m, x)
    n=size(x,1);
    if n>m
        Tx = zeros(n,m+1);
        Tx(:,1) = 1;
        Tx(:,2) = x;
        for n = 3:m+1
            Tx(:,n) = 2*x.*Tx(:,n-1) - Tx(:,n-2);
        end
        rst = Tx(:,m+1);
    else
        rst = zeros(n,1);
        for i=1:n
            T0 = [1;x(i)]; % [T_{0}, T_{-1}]
            A = [2*x(i), -1; 1, 0];
            Tm = A^m * T0; %[T_{m}, T_{m-1}]
            rst(i) = Tm(1);
        end
    end
end
