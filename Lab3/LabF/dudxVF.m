function uprim = dudxVF(t,u)
%STARTVÄRDEN
kx = 0.024;ky = 0.063;
m = 0.900; %kg
g = 9.81; %m/s^2
v = -5;

%1-GRADSSYSTEM AV DE
uprim = [u(2); 
    (-(kx*(u(2)-v)*sqrt((u(2)-v)^2 + u(4)^2))/m);
    u(4);
    ((-m*g - ky*u(4)*sqrt((u(2)-v)^2 + u(4)^2))/m)];
end