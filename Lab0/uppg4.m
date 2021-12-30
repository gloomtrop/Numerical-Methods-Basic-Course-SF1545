clear all, close all

xC = 0; yC = 1.42;
R = 3; fi = 0:2*pi/60:2*pi;
x = xC + R*cos(fi);
y = yC + R*sin(fi);

plot(xC, yC, "o", x, y)
axis equal