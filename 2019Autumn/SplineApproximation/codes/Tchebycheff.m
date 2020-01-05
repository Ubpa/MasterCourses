function rst = Tchebycheff(a, b, n)
    rst = 0.5*((a+b)+(a-b)*cos((2*(1:n)-1)/(2*n)*pi)/cos(pi/(2*n)));
end