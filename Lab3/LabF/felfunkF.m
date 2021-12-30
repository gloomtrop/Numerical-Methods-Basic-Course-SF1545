function [Tut, Yut, fel, i] = felfunkF(F,v0,vinkel, tspan)

%STARTVÄRDEN
x0 = 0; xslut = 15;y0 = 1.3; yslut = 0;
xprim0 = v0*sin(vinkel);yprim0 = v0*cos(vinkel);
u = [x0 xprim0 y0 yprim0]';

%RÄKNAR RUNGEKUTTA
options = odeset("Reltol", 1e-12, "Abstol", 1e-12);
[Tut, Yut] = ode45(F, tspan,u, options);

%HITTAR Y0-VÄRDET
yNeg = Yut(:,3);
i = 1;
while yNeg(i)*yNeg(i +1)> 0
    i = i + 1;
end

%INTERPOLATION AV FÖRSTA ORDNINGEN
xn0 = Yut(i-1,1); xn1 = Yut(i, 1);xn = Yut(i+1,1);
xV = [xn0 xn1 xn]'; yV = [yNeg(i-1) yNeg(i) yNeg(i+1)]';

[p , ~, mu] = polyfit(xV, yV, 2);
xn = fzero(@(xV)polyval(p,xV, [], mu), [xn1 xn]);

fel = xn-xslut;

end

