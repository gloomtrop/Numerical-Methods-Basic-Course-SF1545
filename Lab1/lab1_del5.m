clear, close all
clc


x =[1 32 60 91 121 152 182 213 244 274 305 335]'; 
y = [6.2, 8.1, 10.6, 12.9, 15.5, 18.1, 18.5, 16.3, 14.0, 11.5,8.6, 6.6 ]';
xp = linspace(1, 335, 100);

p = polyfit(x, y, length(x)-1);
yp = polyval(p, x);

S = spline(x, y);
ypS = ppval(S, xp);

yH = pchip(x, y, xp);

subplot(1,4,1); plot(x, y, x, y, "*")
subplot(1,4,2); plot(x, yp, x, y, "*")
subplot(1,4,3); plot(xp, ypS, x, y, "*")
subplot(1,4,4); plot(xp, yH, x, y, "*")
hold on

% plot(x, y, x, yp ,xp, ypS)