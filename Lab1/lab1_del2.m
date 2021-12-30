clear all, close all
clc
% xs =linspace(0, 2*10^-12, 100);xl = 0:0.01:2; y = 0;
% ys = funktionL(xs);yl = funktionL(xl); 
% X = linspace(-10, 10, 10000); ygraf = funktionL(X);
% subplot(3,1,1);plot(xs, ys, xs,y*[ones(size(xs))], "--"); title(["Första rot"]);
% subplot(3,1,2);plot(xl, yl, xl,y*[ones(size(xl))], "--"); title(["Andra rot"]);
% subplot(3,1,3); plot(X,ygraf, X, y*[ones(size(X))]); title(["Större f:span"]);
% ylim([-100, 100])
% hold on


t1 = [1 1]; x= [0.01 1.9]; delta = 10^-8;


for i = 1:2
    display(i)
    display("x f fprim t1 kvad")
    while abs(t1(i))> delta
        [f, fprim] = funktionL(x(i), 1);
        t0 = t1(i);
        t1(i) = f/fprim;
        kvad = t1(i)/(t0^2);
        disp([x(i) f fprim t1(i) kvad ])
        x(i) = x(i)-t1(i);
    end
end
format long 
xr1 = round(x(1), 16);
R1 = (xr1-x(1))/x(1);
xr2 = round(x(2), 2);
R2 = (xr2-x(2))/x(2);

format short e
R = [R1 R2]; display(abs(R))
root = x; display(root)



