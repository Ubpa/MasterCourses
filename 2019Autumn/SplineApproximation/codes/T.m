function rst = T(m, x)
    n = size(x,1);
    Tx = zeros(n,m+1);
    Tx(:,1) = 1;
    Tx(:,2) = x;
    for n = 3:m+1
        Tx(:,n) = 2*x.*Tx(:,n-1) - Tx(:,n-2);
    end
    rst = Tx(:,m+1);
end
