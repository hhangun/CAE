close all; clear all; clc;


size = [3 5 6 7 10 20 40];
stress = [74.867 75.298 75.751 73.806 75.177 75.97 73.192];

x0=0:0.1:40;
y0=interp1(size,stress,x0);

plot(size,stress,'o')
hold on;
grid on;
grid minor;

 plot(x0,y0);
% p = polyfit(size, stress, 1);
% x1 = linspace(0,40);
% f1 = polyval(p,x1);
%plot(x1,f1,'r--')

xlabel("Mesh Sizing");
ylabel("Stress(MPa)");
title('Mesh Convergence');

xlim([2 41]);
ylim([71 77]);

legend({'mesh size & stress','line between points', 'polyfit'},'location','northeast');
