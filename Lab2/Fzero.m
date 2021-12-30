function f = Fzero(gamma)

u0 = [310;gamma]; [T45, U45] = ode45('f45', [0 3.3] , u0);

f = U45(end,1)-460;
end

