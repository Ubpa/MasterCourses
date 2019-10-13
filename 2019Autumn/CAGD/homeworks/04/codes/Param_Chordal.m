function t = Param_Chordal(k)
    n = size(k, 1) - 1;
    
    t = [0;cumsum(sqrt(sum((k(2:n+1,:)-k(1:n,:)).^2,2)))];
end