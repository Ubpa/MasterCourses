function DrawSphere(M, isCtrl)
    % control points
    p = zeros(3,3,4);
    % [p11;p21;p31;p12;p22;p32;p13;p23;p33]
    p_orig = [
        1 0 0 1
        1 0 1 1
        0 0 2 2
        1 1 0 1
        1 1 1 1
        0 0 2 2
        0 2 0 2
        0 2 2 2
        0 0 4 4
    ];
    Mp_orig = p_orig * M';
    p(:, 1, :) = Mp_orig(1:3, :);
    p(:, 2, :) = Mp_orig(4:6, :);
    p(:, 3, :) = Mp_orig(7:9, :);
    
    if isCtrl
        % draw control points
        p_eucl = p(:,:,1:3) ./ p(:,:,4);
        p_eucl_rs = reshape(p_eucl, 9, 3);
        plot3(p_eucl_rs(:,1), p_eucl_rs(:,2), p_eucl_rs(:,3), 'r.', 'MarkerSize', 24);

        for i = 1:3
            plot3(p_eucl(i,:,1), p_eucl(i,:,2), p_eucl(i,:,3), 'c:', 'LineWidth', 1);
            plot3(p_eucl(:,i,1), p_eucl(:,i,2), p_eucl(:,i,3), 'c:', 'LineWidth', 1);
        end
    end
    
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
    if isCtrl
        surf(p_eucl(:,:,1), p_eucl(:,:,2), p_eucl(:,:,3),'FaceAlpha', 0.7);
    else
        surf(p_eucl(:,:,1), p_eucl(:,:,2), p_eucl(:,:,3));
    end
    shading interp;
end
