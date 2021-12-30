clear, close all
clc
format long
fi = 0:2*pi/60:2*pi;vec3 = [1,1,3]'; vec3h = [1, 1, 3, 1, 1]';
x = [ 4, 10, 8]';y = [8, 2, 7]'; 
xh =[ 4, 10, 8, 2, 1]'; yh = [8, 2, 7, 9, 5]'; 
xk = xh.*vec3h; yk = yh.*vec3h;

A = [ones(size(x)) x y]; b = x.^2 + y.^2;
c = A\b; x0 = c(2)/2; y0 = c(3)/2; R = sqrt(c(1) + x0^2+y0^2);
f = c(1) + c(2)*x + c(3)*y;

A3 = A.*vec3; b3 = b.*vec3;
c3 = A3\b3; x03 = c3(2)/2; y03 = c3(3)/2; R3 = sqrt(c3(1) + x03^2+y03^2);
f3 = c3(1) + c3(2)*x + c3(3)*y;


Ah = [ones(size(xh)) xh yh]; bh = xh.^2 + yh.^2;
ch = Ah\bh; x0h = ch(2)/2; y0h = ch(3)/2; Rh = sqrt(ch(1) + x0h^2+y0h^2);
fh = ch(1) + ch(2)*xh + ch(3)*yh;

A3h = Ah.*vec3h; b3h = bh.*vec3h;
c3h = A3h\b3h; x03h = c3h(2)/2; y03h = c3h(3)/2; R3h = sqrt(c3h(1) + x03h^2+y03h^2);
f3h = c3h(1) + c3h(2)*xh + c3h(3)*yh;

Ak = [ones(size(xk)) xk yk]; bk = xk.^2 + yk.^2;
ck = Ak\bk; x0k = ck(2)/2; y0k = ck(3)/2; Rk = sqrt(ck(1) + x0k^2 + y0k^2);
fk = ck(1) + ck(2)*xk + ck(3)*yk;



r = b - A*c;r3 = b3 - A3* c3;
rh = bh - Ah*ch;r3h = b3h - A3h*c3h;
rk = bk -Ak*ck;

xKoord = x0 + R*cos(fi); yKoord = y0 + R*sin(fi);
xKoord3 = x03 + R3*cos(fi); yKoord3 = y03 + R3*sin(fi);
xKoordh = x0h + Rh*cos(fi); yKoordh = y0h + Rh*sin(fi);
xKoord3h = x03h + R3h*cos(fi); yKoord3h = y03h + R3h*sin(fi);
xKoordk = x0k + Rk*cos(fi); yKoordk = y0k + Rk*sin(fi);


disp(["Nummer" "x0" "y0" "Radie" "Norm av fel"; 
    "nr1", x0, y0, R, norm(r);
    "nr2", x03, y03, R3, norm(r3);
    "nr3", x0h, y0h, Rh, norm(rh);
    "nr4", x03h, y03h, R3h, norm(r3h);
    "nr5", x0k, y0k, Rk, norm(rk)])
figure(1)
plot(x, y, "*", x0, y0, "*", xKoord, yKoord), hold on
plot(x03, y03, "O",xKoord3, yKoord3), axis equal
legend("V","M", "Cirkel", "M3", "Cirkel*3")
figure(2)
plot(xh, yh, "*", x0h, y0h, "*", xKoordh, yKoordh), hold on
plot(x03h, y03h, "O",xKoord3h, yKoord3h)
plot(xk, yk, "g*",x0k, y0k, "bO", xKoordk, yKoordk), axis equal
legend("V","M", "Cirkel", "M3", "Cirkel*3", "Vk", "Mk", "Cirkelk")



