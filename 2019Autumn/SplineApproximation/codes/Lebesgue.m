function rst = Lebesgue(tau,t)
    n = size(tau,2);
    m = size(t,1);
    rst = sum(abs(ElemCol(@(i) l(tau,i,t), 1:n, m)),2);
end