clear , clf, close, axis([0 10 0 8]), hold on 

x=[]; y=[]; 
for nr=1:3 
    [xp,yp]=ginput(1); 
    plot(xp,yp,"*"), x=[x; xp]; y=[y; yp]; 
end

x= x';y=y';
xx = [x x(1)]; yy = [y y(1)];
dx = diff(xx); dy = diff(yy); sida = sqrt(dx.^2 + dy.^2);

A = [1,1,0;0,1,1;1,0,1]; r = A\sida';
fi = 0:2*pi/60:2*pi;
for i = 1:3
    hold on
    xKoord = x(i) + r(i)*cos(fi); yKoord = y(i) + r(i)*sin(fi);
    fill(xKoord, yKoord, "y");
    plot(x(i), y(i), "o");
end
axis equal
plot(xx, yy, "--")