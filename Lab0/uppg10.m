clear all; close all; clf
a = 3.7415*10^-16; b = 0.01438;lambda = linspace(0,250*10^-8,100);T =[3000, 4000, 5000, 6000];
hold on
    
for i= 1:4
    y = a./(lambda.^5.*(exp((b./(lambda*T(i))))-1));
    plot(lambda, y)
    gtext("T="+int2str(T(i)));
end






