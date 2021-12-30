clear all, close all;

x = -2:0.01:4;
y = 10./sqrt(1+x.^2) + exp(x/2)./(sqrt(2)+sin(pi*x)) + 4./(x -5);

plot(x, y);

