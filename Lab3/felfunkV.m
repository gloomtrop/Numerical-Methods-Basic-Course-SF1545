function [Xut, Yut, fel] = felfunkV(v0, vinkel, tspan, n)

x0 = 0; xslut = 15;
y0 = 1.3; yslut = 0;
xprim0 = v0*sin(vinkel);
yprim0 = v0*cos(vinkel);

u = [x0 xprim0 y0 yprim0]';

[Xut, Yut] = Rksteg(@ dudxV, tspan,u,n);

yNeg = Yut(:,3);
i = 1;

%HÄR KAN FELSKATTNING GÖRAS
while yNeg(i)*yNeg(i +1)> 0
    
    i = i +1;
end 

xn = Yut(i+1,1);xn0 = Yut(i, 1);
xV = [xn xn0]'; yV = [yNeg(i+1) yNeg(i)]';
A = [ones(size(xV)) xV];
c = A\yV; 

t = 1; pprim = c(2);
while (t)>1e-9
    p = c(1) + c(2)*xn;
    g = t;
    t = p/pprim;
    kvot = t/g^2;
    xn = xn - t;
end

fel = xn-xslut;
end


