function rst = Int(f, a, b)
    delta = 0.0001;
    x = a:delta:b;
    n = size(x,2);
    rst = sum(0.5*delta*(Elem(f,x(2:n))+Elem(f,x(1:n-1))));
end