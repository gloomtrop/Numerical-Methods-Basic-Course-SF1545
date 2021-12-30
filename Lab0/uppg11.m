clear all; close all; 
x =[0 4 6.5]'; y = [1.42 6.18 4.75]';A=[ones(size(x)) x x.^2 ];
c = A\y; xx = 0:0.01:8; p2 = c(1) + c(2)*xx + c(3)*xx.^2;

x3 = [x ;8]; y3= [y; 5.55]; A3=[ones(size(x3)) x3 x3.^2 x3.^3];
c3 = A3\y3; p3 = c3(1) + c3(2)*xx + c3(3)*xx.^2 + c3(4)*xx.^3;



plot(xx, p2,xx, p3, "--", x, y, "o"), hold on
stem(x, y)