function rst = ElemCol(f, x, m)
    n = size(x,2);
    rst = zeros(m,n);
    for i = 1:n
        rst(:,i) = f(x(i));
    end
end