function DrawCircle(c, r)
    theta = 0 : 0.01: (2*pi);
    plot(c(1)+ r * cos(theta), c(2) + r * sin(theta), 'y', 'LineWidth', 2);
end