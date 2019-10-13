function x = BezierPoints(k, t, endCondition)
% End Condition
% 1 : Natural
% 2 : Bessel
% 3 : close

n = size(k, 1) - 1;

if n == 0
    x = k;
    return;
end

A = zeros(3*n+1, 3*n+1);
b = zeros(3*n+1, 2);

% delta t
deltaT = t(2:n+1) - t(1:n);

% interpolation
for i = 0 : n
    A(i+1, 3 * i + 1) = 1;
    b(i+1, :) = k(i+1, :);
end

% C1
for i = 1:(n-1)
    idx = 3 * i + 1;
    r = n+1+i;
    A(r, idx - 1) = 1 / deltaT(i);
    A(r, idx) = - 1 / deltaT(i) - 1 / deltaT(i+1);
    A(r, idx + 1) = 1 / deltaT(i+1);
end

% C2
for i = 1:(n-1)
    idx = 3 * i + 1;
    r = 2*n+i;
    A(r, idx - 2) = - 1 / deltaT(i)^2;
    A(r, idx - 1) = 2 / deltaT(i)^2;
    A(r, idx) =  - 1 / deltaT(i)^2 + 1 / deltaT(i+1)^2;
    A(r, idx + 1) = - 2 / deltaT(i+1)^2;
    A(r, idx + 2) = 1 / deltaT(i+1)^2;
end

% end condition

if n <= 1 || endCondition == 1
    % natural
    A(3*n, 1) = 0.5;
    A(3*n, 2) = -1;
    A(3*n, 3) = 0.5;

    A(3*n+1, 3*n-1) = 0.5;
    A(3*n+1, 3*n) = -1;
    A(3*n+1, 3*n+1) = 0.5;
elseif endCondition == 2
    % bessel
    c11 = (t(1) - t(2) + t(1) - t(3)) / ((t(1)-t(2)) * (t(1) - t(3)));
    c12 = (t(1) - t(1) + t(1) - t(3)) / ((t(2)-t(1)) * (t(2) - t(3)));
    c13 = (t(1) - t(1) + t(1) - t(2)) / ((t(3)-t(1)) * (t(3) - t(2)));
    derivative1 = c11 * k(1,:) + c12 * k(2,:) + c13 * k(3,:);
    A(3*n, 1) = -1;
    A(3*n, 2) = 1;
    b(3*n, :) = (t(2)-t(1))/3 * derivative1;
    
    c21 = (t(n+1) - t(n) + t(n+1) - t(n+1)) / ((t(n-1)-t(n)) * (t(n-1) - t(n+1)));
    c22 = (t(n+1) - t(n-1) + t(n+1) - t(n+1)) / ((t(n)-t(n-1)) * (t(n) - t(n+1)));
    c23 = (t(n+1) - t(n-1) + t(n+1) - t(n)) / ((t(n+1)-t(n-1)) * (t(n+1) - t(n)));
    
    derivative2 = c21 * k(n-1,:) + c22 * k(n,:) + c23 * k(n+1,:);
    A(3*n+1, 3*n) = -1;
    A(3*n+1, 3*n+1) = 1;
    b(3*n+1, :) = (t(n+1)-t(n)) / 3 * derivative2;
elseif endCondition == 3
    % close
    A(3*n, 1) = - 1 / deltaT(1);
    A(3*n, 2) = 1 / deltaT(1);
    A(3*n, 3*n) = 1 / deltaT(n);
    A(3*n, 3*n+1) = - 1 / deltaT(n);
    
    A(3*n+1, 1) = 1 / deltaT(1)^2;
    A(3*n+1, 2) = - 2 / deltaT(1)^2;
    A(3*n+1, 3) = 1 / deltaT(1)^2;
    A(3*n+1, 3*n-1) = -1 / deltaT(n)^2;
    A(3*n+1, 3*n) = 2 / deltaT(n)^2;
    A(3*n+1, 3*n+1) = - 1 / deltaT(n)^2;
end

% rst
x = A \ b;

end