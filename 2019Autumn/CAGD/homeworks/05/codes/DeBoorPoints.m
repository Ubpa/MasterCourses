function d = DeBoorPoints(k, s)
    n = size(k,1) - 1;
    
    if n <= 1
        d = k;
        return;
    end
    
    % extent k t
    t = [s(1); s(1); s(1); s; s(n+1); s(n+1); s(n+1)];
    k = [k(1,:);k;k(size(k,1), :)];
    
    A = zeros(n+3);
    b = k;
    
    for i=1:(n+3)
        idx = i+2; % for t
        if t(idx) == t(idx-1)
            if t(idx) == t(idx+1)
                % end point
                A(i, i) = 1;
            else
                % left natural
                A(i,i-1) = t(idx+2) - t(idx);
                A(i,i) = -(t(idx+2)-t(idx)) - (t(idx+1)-t(idx-1));
                A(i,i+1) = t(idx+1) - t(idx-1);
                b(i,:) = [0, 0];
            end
        elseif t(idx) == t(idx+1)
            % right natural
            A(i,i-1) = t(idx+1) - t(idx-1);
            A(i,i) = -(t(idx+1)-t(idx-1)) - (t(idx)-t(idx-2));
            A(i,i+1) = t(idx) - t(idx-2);
            b(i,:) = [0, 0];
        else
            A(i,i-1) = N(t,idx-3,4,s(idx-3));
            A(i,i) = N(t,idx-2,4,s(idx-3));
            A(i,i+1) = N(t,idx-1,4,s(idx-3));
            b(i,:) = k(i,:);
        end
    end
    
    % natural end conditions
%     alpha(1) = s(3) - s(1);
%     beta(1) = -(s(3)-s(1))-(s(2)-s(1));
%     gamma(1) = s(2) - s(1);
%     
%     alpha(n+1) = s(n+1) - s(n);
%     beta(n+1) = -(s(n+1)-s(n)) - (s(n+1)-s(n-1));
%     gamma(n+1) = s(n+1) - s(n-1);
%     
%     for i = 2:n
%         alpha(i) = N(t, i, 4, s(i));
%         beta(i) = N(t, i+1, 4, s(i));
%         gamma(i) = N(t, i+2, 4, s(i));
%     end
%     
%     % TODO Thomas Ëã·¨
%     A = zeros(n+3);
%     A(1,1)=1;
%     A(n+3, n+3)=1;
%     for i = 2:(n+2)
%         A(i, i-1) = alpha(i-1);
%         A(i, i) = beta(i-1);
%         A(i, i+1)=gamma(i-1);
%     end
%     
%     b = zeros(n+3, 2);
%     b(1,:) = k(1,:);
%     b(n+3,:) = k(n+1,:);
%     
%     for i = 3:(n+1)
%         b(i, :) = k(i-1,:);
%     end
    
    [A,b]
    
    d = A \ b;
end