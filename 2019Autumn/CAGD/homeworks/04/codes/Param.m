function t = Param(k, parameterization)
% Parameterization
% 1 : Uniform
% 2 : Chordal
% 3 : Centripetal

n = size(k, 1) - 1;

switch parameterization
    case 1
        t = Param_Uniform(n);
    case 2
        t = Param_Chordal(k);
    case 3
        t = Param_Centripetal(k);
    otherwise
        t = Param_Uniform(n);
end

end