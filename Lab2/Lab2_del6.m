close


opts = odeset('Reltol', 1e-3, 'AbsTol',1e-10);

for gamma=linspace(120,125, 6)
    u0 = [310;gamma];
    
    [X , U] = ode45('f45', [0 3.3], u0);
    subplot(1,3,1), plot(X, U(:,1)), grid on, hold on
    text(3.31, U(end,1), ['\gamma=', num2str(gamma)])
end
    
yprim0 = fzero('Fzero', 124);
u0 = [310;yprim0];

[X45, U45] = ode45('f45', [0 3.3], u0, opts);

subplot(1,3,2), plot(X45, U45(:,1))

disp("Temp för ODE45")
disp(U45(22,1))
% 
% p = polyfit(X45, U45(:,1), 2);
% pval = polyval(p, X45);
% 
% subplot(1,3,3), plot(X45, pval)
% 
% y4x = polyval(p, 1.76);


