close all;
figure(1);
grid on;
hold on;
axis([-1 1 0 1.5]);

x=-0.999:0.001:0.999;
for i=1:6
    plot(x,Elem(@(x) cB(i,x),x),'linewidth',2);
end

legend('m=1','m=2','m=3','m=4','m=5','m=6');
