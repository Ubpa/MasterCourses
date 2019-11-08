function DrawSphere(M)
    % control points
    p = zeros(3,3,4);
    p(1,1,:) = M * [1;0;0;1];
    p(1,2,:) = M * [1;0;1;1];
    p(1,3,:) = M * [0;0;2;2];
    
    p(2,1,:) = M * [1;1;0;1];
    p(2,2,:) = M * [1;1;1;1];
    p(2,3,:) = M * [0;0;2;2];
    
    p(3,1,:) = M * [0;2;0;2];
    p(3,2,:) = M * [0;2;2;2];
    p(3,3,:) = M * [0;0;4;4];
    
    % homogeneous
    n = 32;
    u = (0:1/(n-1):1)' * ones(1, n);
    v = ones(n, 1) * (0:1/(n-1):1);
    p_homo = zeros(n,n,4);
    for i = 0:2
        for j = 0:2
            c = Bernstein(2,i,u) .* Bernstein(2,j,v);
            p_homo = p_homo + repmat(c,1,1,4) .* p(i+1,j+1,:);
        end
    end
    
    % project
    p_eucl = p_homo(:,:,1:3) ./ p_homo(:,:,4);
    
    % draw
    surf(p_eucl(:,:,1), p_eucl(:,:,2), p_eucl(:,:,3));
    shading interp;
end
