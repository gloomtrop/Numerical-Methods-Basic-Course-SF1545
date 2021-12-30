clear all, close all;

x = [0 4 6.5]; y = [1.42 6.18 4.75];

xx = [x x(1)]; yy = [y y(1)];

plot(xx, yy);

dx = diff(xx); dy = diff(yy);

sida = sqrt(dx.^2 + dy.^2);
omkrets = sum(sida);
s = omkrets/2; area = sqrt(s*prod(s-sida));

disp("omkrets: " + omkrets + " area: " + area);