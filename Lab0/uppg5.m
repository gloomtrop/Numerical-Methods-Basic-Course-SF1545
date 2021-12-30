clear all, close all;

x = [0 4 6.5]; y = [1.42 6.18 4.75];
xx = [x x(1)]; yy = [y y(1)];
dx = diff(xx); dy = diff(yy); sida = sqrt(dx.^2 + dy.^2);

A = [1,1,0;0,1,1;1,0,1]; r = A\sida';
fi = 0:2*pi/60:2*pi;
for i = 1:3
    hold on
    xKoord = x(i) + r(i)*cos(fi); yKoord = y(i) + r(i)*sin(fi);
    fill(xKoord, yKoord, "y");
    plot(x(i), y(i), "o");
end

plot(xx, yy, "--")