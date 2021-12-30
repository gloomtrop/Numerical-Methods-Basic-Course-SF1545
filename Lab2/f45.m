function [uprim] = f45(t,u)

L = 3.3;
uprim = [u(2)  ((- 265*exp(-(t-(L/2)).^2) - (1/5)*u(2))/(3 + (t/5)))]';

end

