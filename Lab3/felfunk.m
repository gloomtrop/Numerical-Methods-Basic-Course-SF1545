function [Xut, Yut, fel, i] = felfunk(F,v0,vinkel, tspan, n)
%STARTVÄRDEN
x0 = 0; xslut = 15;y0 = 1.3; yslut = 0.5;
xprim0 = v0*sin(vinkel);yprim0 = v0*cos(vinkel);
u = [x0 xprim0 y0 yprim0]';
%RÄKNAR RUNGEKUTTA
[Xut, Yut] = Rungekutta(F, tspan,u,n);
%HITTAR Y0-VÄRDET
yNeg = Yut(:,3);i = 1;
while yNeg(i)*yNeg(i +1)> 0
    i = i +1;
end


%INTERPOLATION AV ANDRA ORDNINGEN
 xn0 = Yut(i-1,1); xn1 = Yut(i, 1);xn = Yut(i+1,1);
xV = [xn0 xn1 xn]'; yV = [yNeg(i-1) yNeg(i) yNeg(i+1)]';
A = [ones(size(xV)) xV xV.^2];c = A\yV; 
%NEWTON-RAPHSON FÖR XN
t = 1; 
while (t)>1e-9
    p = c(1) + c(2)*xn + c(3)*xn^2;
    pprim = c(2) + 2*c(3)*xn;
    g = t;
    t = p/pprim;
    kvot = t/(g^2);
    xn = xn - t;
end
fel = xn-xslut;
end


