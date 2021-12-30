clear all, close all


t = [121 152 182 213 244 274]'; tgraf =linspace(120, 365, 120)'; th=[1 32 60 91 121 152 182 213 244 274 305 335]';thgraf=linspace(1,365,120)';
y = [15.5 18.1 18.5 16.3 14.0 11.5]';
yh = [6.2, 8.1, 10.6, 12.9, 15.5, 18.1, 18.5, 16.3, 14.0, 11.5,8.6, 6.6 ]';

A = [ones(size(t)) t t.^2];
c = A\y;r = y - A*c;
Agraf = [ones(size(tgraf)) tgraf tgraf.^2];
ygraf = Agraf*c;

Ah = [ones(size(th)) th th.^2];
ch = Ah\yh;


ph = ch(1) + ch(2)*thgraf + ch(3)*thgraf.^2; 
rh = yh - Ah*ch;norm(rh);

p = polyfit(t, y, 2); ph1 = polyfit(th, yh, 2);
yp = polyval(p, tgraf); 

june6 = polyval(p, 156); june6h = polyval(ph1, 156);
dec24 = polyval(p, 357); dec24h = polyval(ph1, 357);
disp(["Mätning" "6 of June" "24 of Dec" "Norm";"nr1" june6 dec24 norm(r);"nr2" june6h dec24h norm(rh)])


subplot(2,2,1), plot(tgraf, ygraf, t, y, "o", 156, june6, "r*", 0, 0)
subplot(2,2,2), plot(t, r);
subplot(2,2,3), plot(thgraf, ph, th, yh, "o", 0, 0)
subplot(2,2, 4), plot(th, rh)


