function rst = cB(m, x)
    t = cos((1-(0:m)/m)*pi);
    rst = m * Q(t,x);
end