clear, close
clc
a = 0; b1 = 0.625; b2= 0.635; b = 6; tol = 10^-10; n = 100; h = (b-a)/n; 
f = @(x) 117*exp(-(((5*x-pi)/0.003)).^2); x = a:h:b;
fprim = @(x) (-2*5*117/0.003^2)*(5*x - pi).*exp(-((5*x - pi)/0.003).^2);

t1 = 1; n = 200;
k = 1; Etrunk = 1; Etrunk1 = 1;

while abs(Etrunk)> tol
    t2 = t1;
    h = (b2-b1)/n;
    x = linspace(b1,b2,n+1);
    y = f(x);
    t0 = (y(1) + y(length(y)))/2;
    t1 = h*(sum(y) - t0);
    Etrunk = t1 - t2;
    kvot = Etrunk1/Etrunk;
    n = 2*n; Etrunk1 = Etrunk;
    k = k + 1;
end

% disp(["Etrunk" "kvot"])
% disp([Etrunk kvot])
disp("T")
disp(t1)

i1 = integral(f, a, b1);
i2 = integral(f, b1, b2);
i3 = integral(f, b2, b);

i = i1 + i2 + i3;

[q1, points1] = quad(f, a, b1, tol);
[q2, points2]= quad(f, b1, b2, tol);
[q3, points3 ]= quad(f, b2, b, tol);

q = q1 + q2 + q3;
totPoints = points1 + points2 + points3;

ni = 1000;
hi = (b2 - b1)/10; xi = b1:hi:b2;

fprim(0.628318);
bi = 0.628318;

totfel = 1;Etri = 1;
iq1 = 1;k = 4;



while abs(Etri)>tol
    [iq1, ipoints]= quad(f,b1,b2,totfel);
    [q2i, points2i] = quad(f, b1, bi, totfel);
    [q3i, points3i]= quad(f, bi, b2, totfel);
    if q1 + q3< tol
        Etri = q2 - (q2i + q3i);
        k = k + 1;
        totfel = 10^(-k);
    else
        Etri = q - (q2i + q3i); 
        k = k + 1;
        totfel = 10^(-k);
    end
end

disp(["T-quad" "T-integral"])
disp([t1-q t1 - i]) 

disp(["iq1" "ipoints" "totfel" "Etri"])
disp([iq1 ipoints totfel Etri]) 

disp(["Quad" "Integral" "Total points try 1" "TRy 2" ])
disp([q i totPoints points2i + points3i])




subplot(1,3, 1),plot(a:0.001:b1, f(a:0.001:b1))
subplot(1,3, 2),plot(b1:10^-6:b2, f(b1:10^-6:b2),0.628318 , f(0.628318), "o")
subplot(1,3, 3),plot(b2:0.0001:b, f(b2:0.0001:b))








