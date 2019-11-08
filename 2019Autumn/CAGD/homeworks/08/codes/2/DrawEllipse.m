function DrawEllipse(a,b,c,M,isCtrl)
    % control points
    
    % [p11;p21;p31;p41;p12;p22;p32;p42;p13;p23;p33;p43;p14;p24;p34;p44]
    p_orig = [
        a 0 0 1 
        a 0 2/3*c 1 
        2/3*a 0 4/3*c 4/3 
        0 0 2*c 2 
        
        a 2/3*b 0 1 
        a 2/3*b 2/3*c 1 
        2/3*a 4/9*b 4/3*c 4/3 
        0 0 2*c 2 
        
        2/3*a 4/3*b 0 4/3 
        2/3*a 4/3*b 8/9*c 4/3 
        4/9*a 8/9*b 16/9*c 16/9 
        0 0 8/3*c 8/3 
        
        0 2*b 0 2 
        0 2*b 4/3*c 2 
        0 4/3*b 8/3*c 8/3 
        0 0 4*c 4 
    ];
    Mp_orig = p_orig * M';
    
    p = zeros(4,4,4);
    p(:, 1, :) = Mp_orig(1:4, :);
    p(:, 2, :) = Mp_orig(5:8, :);
    p(:, 3, :) = Mp_orig(9:12, :);
    p(:, 4, :) = Mp_orig(13:16, :);
    
    if isCtrl
        % draw control points
        p_eucl = p(:,:,1:3) ./ p(:,:,4);
        p_eucl_rs = reshape(p_eucl, 16, 3);
        plot3(p_eucl_rs(:,1), p_eucl_rs(:,2), p_eucl_rs(:,3), 'r.', 'MarkerSize', 24);

        for i = 1:4
            plot3(p_eucl(i,:,1), p_eucl(i,:,2), p_eucl(i,:,3), 'c:', 'LineWidth', 1);
            plot3(p_eucl(:,i,1), p_eucl(:,i,2), p_eucl(:,i,3), 'c:', 'LineWidth', 1);
        end
    end
    
    % homogeneous
    n = 32;
    u = (0:1/(n-1):1)' * ones(1, n);
    v = ones(n, 1) * (0:1/(n-1):1);
    p_homo = zeros(n,n,4);
    for i = 0:3
        for j = 0:3
            c = Bernstein(3,i,u) .* Bernstein(3,j,v);
            p_homo = p_homo + repmat(c,1,1,4) .* p(i+1,j+1,:);
        end
    end
    
    % project
    p_eucl = p_homo(:,:,1:3) ./ p_homo(:,:,4);
    
    % draw
    if isCtrl
        surf(p_eucl(:,:,1), p_eucl(:,:,2), p_eucl(:,:,3),'FaceAlpha', 0.7);
    else
        surf(p_eucl(:,:,1), p_eucl(:,:,2), p_eucl(:,:,3));
    end
    shading interp;
    
end