clear all, close all
clc

x0 = [0, 1]; x1 = [0.01, 2];
h0 = [1, 1]; h1 = [1, 1];

delta = 10^-8;
for i=1:2
    display(i)
    f0(i) = funktionL(x0(i), 1);
    while abs(x1(i)-x0(i))>delta
        f1(i) = funktionL(x1(i), 1);
        t(i) = f1(i)*(x1(i)-x0(i))/(f1(i)-f0(i));
        k(i) = t(i)/(h0(i)*h1(i))
        x0(i) = x1(i);
        f0(i) = f1(i);
        x1(i) = x1(i) - t(i);
        linj = t(i)/h1(i);
%         disp([k(i) linj t(i) ])
        h0(i) = h1(i); h1(i) = t(i);
        
        
        
    end
end

format short e

f0 = funktionL(x0, i);
rot = x0;
