function [uprim] = fODE(t,u)

g = 9.81; L = 2.7;

uprim = [u(2) ,-g *sin(u(1))/L]';

end

