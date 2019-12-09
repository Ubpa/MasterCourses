function rst = Q(t, x)
    m = size(t,2)-1;
    f = @(y) TruncPower(x-y,m-1);
    rst = (-1)^m * DiffQuotient(t,f);
end