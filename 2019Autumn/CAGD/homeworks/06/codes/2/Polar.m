function rst = Polar(c, u)
    n = size(u, 2);
    k = size(u, 1);
    m = size(c, 2);
    
    if n ~= size(c,1)-1
        error('size(u, 2)  ~= size(c,1) - 1');
    end
    
    A = zeros(k, n+1);
    A(:, 1) = 1;
    
    for i = 1 : n
        idx = nchoosek(1:n, i);
        col = zeros(k, 1);
        for j = 1 : size(idx, 1)
            col = col + prod(u(:, idx(j,:)), 2);
        end
        A(:, i+1) = col / size(idx, 1);
    end
    A
    rst = A * c;
end