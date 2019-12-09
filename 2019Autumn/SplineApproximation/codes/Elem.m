function rst = Elem(f, x)
    rst = zeros(size(x));
    for i = 1:size(rst,1)
        for j = 1:size(rst,2)
            rst(i,j) = f(x(i,j));
        end
    end
end