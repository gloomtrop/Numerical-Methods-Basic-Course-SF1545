clear all, close all;

x = 1:0.01:4;

f = @(x) x.*(1+sin(x).*pi);
g = @(x) (5*exp(-x/2)./(3-2*cos(2*pi*x)));

subplot(2,2,1);plot(x, f(x));
subplot(2,2,2);plot(x, g(x));
subplot(2,2,3);plot(x, g(x)+f(x));
subplot(2,2,4);plot(x, f(x)./g(x));




