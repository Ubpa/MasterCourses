function rst = l(tau,i,t)
    a = (t - tau) ./ (tau(i)-tau);
    rst = prod([a(:,1:i-1),a(:,i+1:size(tau,2))],2);
end

