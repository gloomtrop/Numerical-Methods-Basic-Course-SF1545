function [f, fprim] = funktionL(x, k)

f = 52*k*x - ((x.^2 + x + 0.03)./( x + 1)).^7 - 17*x.*exp(-x);

fprim = 52*k - 7*((x.^2 + x + 0.03).^6)./(( x + 1).^8).*(((2*x +1).*(x+1))-(x.^2+x+0.03))+ 17*exp(-x).*(x-1);

end

