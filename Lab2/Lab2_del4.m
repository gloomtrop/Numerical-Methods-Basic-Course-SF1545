
clc


tspan = linspace(0, 7*pi/3, 10000); u0 = [2*pi/7 0.7]';

Y = [];
for i=5:9
    opts = odeset('Reltol', 10^-(i),'AbsTol',10^-i);
    [T45, U45] = ode45('fODE', tspan, u0, opts);
    y45 = U45(:,1); Y(i +1) = y45(1);
end

EtrunkODE45 = Y(8) - Y(9)
% tspanG = linspace(0,7*pi/3, 50);
% [T45G, U45G] = ode45('fODE', tspanG, u0);
% y45G = U45G(:,1);

y0 = [];
t0 = [];
for i=1:length(y45)-1
    
    if y45(i)*y45(i+1)<0
        y0(end + 1, :) = y45(i);
        t0(end + 1, :)= T45(i);
        y0(end + 1, :) = y45(i +1);
        t0(end + 1, :)= T45(i + 1);
    end
    
end

t1 = linspace(t0(1), t0(6), 1000);
t2 = linspace(t0(1), t0(6), 1000);
% pf = c(1) +c(2)*t1 + c(3)*t1.^2 + c(4)*t1.^3 + c(5)*t1.^4 +c(6)*t1.^5;

p1 = polyfit([t0(1) t0(3) t0(4) t0(5) t0(6)]', [y0(1) y0(3) y0(4) y0(5) y0(6)]',4); p2 = polyfit(t0(1:6), y0(1:6),5);
pf1 = polyval(p1, t1); pf2 = polyval(p2, t2); 
rot1 = roots(p1); rot2 = roots(p2);

T1 = rot1(2)-rot1(4)
T2 = rot2(2)-rot2(4)
Etrunk = T2 - T1

subplot(1,2,1), plot(T45, U45(:,1),T45, U45(:,2), t1, pf1, t2, pf2), grid on
legend("Vinkel(t)" , "Vinkelhastighet(t)") 
% subplot(1,3,2), plot(t, p, t, 0*[ones(size(t))], "--", t0, y0, "Or")
% subplot(1,3,3), plot(T45, p, T45, 0*[ones(size(T45))], "--")
% plot(T45, y1)
disp("Period")

p = T1

%subplot(1,2,2), anim(T45G,y45G, 2.7)