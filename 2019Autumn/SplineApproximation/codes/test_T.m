close all;
figure(1);
grid on;
hold on;
axis([-1 1 -1 1]);

x=-0.999:0.001:0.999;
for i=0:4
    plot(x,Elem(@(x) T(i,x),x),'linewidth',2);
end

legend('m=0','m=1','m=2','m=3','m=4');

tic;
for i=1:10
    T(100000,ones(100,1));
    T(100,(0:0.00001:1)');
end
toc;
