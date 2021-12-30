clear all, close all
clc
k = 1;
xs =linspace(0, 2*10^-12, 100);xl = 0:0.01:2; y = 0;
ys = funktionL(xs, k);yl = funktionL(xl, k); 
X = linspace(-10, 10, 10000); ygraf = funktionL(X, k);
subplot(3,1,1);plot(xs, ys, xs,y*[ones(size(xs))], "--"); title(["Första rot"]);
subplot(3,1,2);plot(xl, yl, xl,y*[ones(size(xl))], "--"); title(["Andra rot"]);
subplot(3,1,3); plot(X,ygraf, X, y*[ones(size(X))]); title(["Större f:span"]);
ylim([-100, 100])
hold on


t1 = [1 1]; x= [0.1 1.9]; relativfel = 10^-8; x0 = [1 1]; k = [0.96, 1, 1.04;]; S = [];
for j = 1:3
    disp(["k" + j + " = " + k(j)]);
    for i = 1:2
%         disp("Rotnummer " + i)
%         disp(["x" "f" "fprim" "t1" "kvad"])
        while abs((x(i)-x0(i))/x(i))> relativfel
            [f, fprim] = funktionLb(x(i), k(j));
            t0 = t1(i);
            t1(i) = f/fprim;
            kvad = t1(i)/(t0^2);
%             disp([x(i) f fprim t1(i) kvad ])
            x0(i) = x(i);
            x(i) = x(i)-t1(i);
        end
    end
    S = [S, x'];
    disp(x)
    t1 = [1 1]; x= [0.1 1.9];
end
 
sdel = abs((S(1,1) - S(1,3))/S(1,2))*100;
ldel = abs((S(2,1) - S(2,3)))/S(2,2)*100;

disp(["Lilla rotens fel" sdel + "%"; "Stora rotens fel" ldel+ "%"])
