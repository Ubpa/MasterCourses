function rst = DiffQuotient(t,f)
    n = size(t,2);
    
    df = zeros(1,n);
	for i=1:n
        df(i)=f(t(i));
	end
    
	for i=n-1:-1:1
        for j=1:i
            df(j) = (df(j+1)-df(j))/(t(j+n-i)-t(j));
        end
    end
    
	rst = df(1);
end
