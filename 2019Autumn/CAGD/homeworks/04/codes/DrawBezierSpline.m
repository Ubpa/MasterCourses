function DrawBezierSpline(k, parameterization, endCondition, inControl)
% Parameterization
% 1 : Uniform
% 2 : Chordal
% 3 : Centripetal

% End Condition
% 1 : Natural
% 2 : Bessel
% 3 : close

n = size(k, 1) - 1;

if n < 0
    return;
end

t = Param(k, parameterization);

%plot(k(:,1), k(:, 2), '.r', 'MarkerSize', 32);
%plot(k(:,1), k(:, 2), 'b', 'LineWidth', 2);

if n == 0
    return;
end

b = BezierPoints(k, t, endCondition);
%plot(b(:,1), b(:, 2), 'g', 'LineWidth', 2);

for i = 1:n
    DrawBezierCurve(b(3*i-2:3*i+1,:), false);
end

if inControl
    plot(k(2:n,1), k(2:n, 2), '.r', 'MarkerSize', 32);
    plot(k(1,1), k(1, 2), '.y', 'MarkerSize', 32);
    plot(k(n+1,1), k(n+1, 2), '.y', 'MarkerSize', 32);
    %plot(b(:,1), b(:, 2), 'g', 'LineWidth', 2);
end

end