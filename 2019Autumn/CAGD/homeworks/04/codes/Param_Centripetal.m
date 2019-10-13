function t = Param_Centripetal(k)
    n = size(k, 1) - 1;
    
    t = [0;cumsum(sum((k(2:n+1,:)-k(1:n,:)).^2,2).^(0.25))];
end