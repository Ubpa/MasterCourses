function d = DeBoorPoints(k, s)
    n = size(k,1) - 1;
    
    if n <= 0
        d = k;
        return;
    end
    
    % extent k t
    t = [s(1); s(1); s(1); s; s(n+1); s(n+1); s(n+1)];
    k = [k(1,:);k;k(size(k,1), :)];
    
    A = zeros(n+3);
    b = k(:,1:2);
    
    for i=1:(n+3)
        idx = i+2; % for t
        if t(idx) == t(idx-1)
            if t(idx) == t(idx+1) % ���
                A(i, i) = 1;
            elseif k(i,3) == 1 % ֱ����
                A(i,i) = 1;
            elseif k(i-1,3) == 1 % ֱ������Ȼ
                A(i,i-2) = t(idx+1) - t(idx-1);
                A(i,i-1) = -(t(idx+1)-t(idx-1)) - (t(idx)-t(idx-2));
                A(i,i) = t(idx) - t(idx-2);
                b(i,:) = [0, 0];
            else %�������Ȼ
                A(i,i-1) = t(idx+2) - t(idx);
                A(i,i) = -(t(idx+2)-t(idx)) - (t(idx+1)-t(idx-1));
                A(i,i+1) = t(idx+1) - t(idx-1);
                b(i,:) = [0, 0];
            end
        elseif t(idx) == t(idx+1)
            if k(i,3) == 1 % ֱ��β
                A(i,i) = 1;
            elseif k(i+1,3) == 1 % ��һֱ����
                % ֱ������Ȼ
                A(i,i) = t(idx+2) - t(idx);
                A(i,i+1) = -(t(idx+2)-t(idx)) - (t(idx+1)-t(idx-1));
                A(i,i+2) = t(idx+1) - t(idx-1);
                b(i,:) = [0, 0];
            else
                %�������Ȼ
                A(i,i-1) = t(idx+1) - t(idx-1);
                A(i,i) = -(t(idx+1)-t(idx-1)) - (t(idx)-t(idx-2));
                A(i,i+1) = t(idx) - t(idx-2);
                b(i,:) = [0, 0];
            end
        else
            A(i,i-1) = N(t,idx-3,4,s(idx-3));
            A(i,i) = N(t,idx-2,4,s(idx-3));
            A(i,i+1) = N(t,idx-1,4,s(idx-3));
        end
    end
    d = A \ b;
end