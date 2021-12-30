clear, close, 
clc
xx = linspace(0,10^-4,1000); yy = fInt(xx);
xG = linspace(0,6,1000); yG =fInt(xG);


a = 0; b = 6; n = 100; 
Ekap = 1/(24*exp(b^3/8)*b^2);
Etot = 1; t1 = 1;
Etrunk1 = 1;k =1;

% for i=1:5
%     t2 = t1
%     h = (b-a)/n;
% %     x = a:h:b;
%     x = linspace(a,b,n+1);
%     y = fIntexp(x);
%     t0 = (y(1) + y(length(y)))/2;
%     t1 = h*(sum(y) - t0)
%     Etrunk = t1 - t2 
%     Etot= Etrunk + Ekap;
%     kvot = Etrunk1/Etrunk
%     n = 2*n; Etrunk1 = Etrunk;
%     disp(["Etrunk" "kvot"])
%     disp([Etrunk kvot])
%     k = k + 1
% end


while abs(Etot)>10^-10
    t2 = t1
    h = (b-a)/n;
    x = linspace(a,b,n+1);
    y = fIntexp(x);
    t0 = (y(1) + y(length(y)))/2;
    t1 = h*(sum(y) - t0)
    Etrunk = t1 - t2 
    Etot= Etrunk + Ekap;
    kvot = Etrunk1/Etrunk
    n = 2*n; Etrunk1 = Etrunk;
    disp(["Etrunk" "kvot"])
    disp([Etrunk kvot])
    k = k + 1
end

subplot(1, 3, 1), plot(xx, yy)
subplot(1, 3, 2), plot(xG, yG, 0, 1/24, "o")
subplot(1,3, 3), plot(x, y, "--")


disp(["Totalfel" "T(h)"])
disp([Etrunk t1])






 





