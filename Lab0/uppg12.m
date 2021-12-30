clear all, close all
x =[0 4 6.5]'; y = [1.42 6.18 4.75]'; A = [ones(size(x)) x y];

b = x.^2 + y.^2;c = A\b;mp = [c(2)*0.5 c(3)*0.5];
r = sqrt(c(1)+ mp(1).^2 +mp(2).^2);
fi = 0:2*pi/60:2*pi;
xK = mp(1) + r*cos(fi);
yK = mp(2) + r*sin(fi);
plot(x, y , "o", xK, yK);