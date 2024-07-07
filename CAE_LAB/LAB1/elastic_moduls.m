close all; clear all; clc;


d = [0 1 2 3 4 5 10 30 50];
n = 1:6;
x=48*45*10^-12*10^-3*d(n);
y=9.81*0.2*(n-1)*0.42^3;

p = polyfit(x,y,1);
f = polyval(p,x);

plot(x,y,'o',x,f,'-')
grid on;
grid minor;

xlabel("48δI");
ylabel("PL^3");
title('E1');

legend({'data','fitting line'},'location','northwest');

%{
d = [0 0.913 2.38 3.49 4.68 6.03];
m = [0 0.206 0.412 0.618 0.824 1.03];
n = 1:5;
x=45*10^-12*10^-4*d(n);
y=1.5*10^-3*m(n);

p = polyfit(x,y,1);
f = polyval(p,x);

plot(x,y,'o',x,f,'-')
grid on;
grid minor;

xlabel("Iϵ");
ylabel("Mc");
title('E2');

legend({'data','fitting line'},'location','northwest');
%}