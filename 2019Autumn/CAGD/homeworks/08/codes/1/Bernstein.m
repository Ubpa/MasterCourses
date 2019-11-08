function rst = Bernstein(n, i, t)
    rst = nchoosek(n, i) * t.^i .* (1-t).^(n-i);
end
