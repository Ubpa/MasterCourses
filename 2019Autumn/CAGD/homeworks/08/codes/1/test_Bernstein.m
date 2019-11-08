clc;
close all;
figure(1);

t = 0 : 0.01:1;
maxN = 4;

for n = 0:maxN
    subplot(1, maxN+1, n+1);
    hold on;
    for i = 0:n
        y = Bernstein(n,i,t);
        plot(t, y);
    end
end
