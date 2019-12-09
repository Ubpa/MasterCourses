function rst = DiffQuotient(t,f)
    n = size(t,2);
    if n == 1
        rst = f(t);
    else
        rst = (DiffQuotient(t(2:n),f)-DiffQuotient(t(1:n-1),f))/(t(n)-t(1));
    end
end
