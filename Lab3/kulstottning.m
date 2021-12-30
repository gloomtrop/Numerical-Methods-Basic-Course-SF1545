
kx = 0.024;ky = 0.063;
m = 0.9; 
y0 = 1.3;x0 = 0;
xslut = 15; yslut = 0;
alfa = pi/3;
v0 = 18; 
xprim0 = v0*cos(alfa);
yprim0 = v0*sin(alfa);
g = 9.82; 
n = 2;

u = [x xprim y yprim]';
tspan = [0 2]';


for i=1:5
    u = Rksteg(tspan,u,n)
    n = 2*n;
    
end





