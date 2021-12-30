function [f, fprim] = funktionLb(x, k)

f = 52*x - ((x.^2 + x + 0.03)./( x + 1)).^7 - 17*k*x.*exp(-x);

fprim = 52 - 7*((x.^2 + x + 0.03).^6)./(( x + 1).^8).*(((2*x +1).*(x+1))-(x.^2+x+0.03))+ 17*k*exp(-x).*(x-1);

end

