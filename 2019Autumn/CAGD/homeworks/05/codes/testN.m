clc;
close all;

figure(1);
hold on;

tStart = 0;

for tEnd = 1:4
    t=(tStart:tEnd)';

    x = ((tStart-1):0.001:(tEnd+1))';
    n = size(x,1);
    y = zeros(n,1);
    for i = 1:size(x,1)
    	y(i) = N(t, 1, tEnd, x(i));
    end
    
    plot(x, y);
end
