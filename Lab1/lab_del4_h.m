clear all, close all


%t = linspace(1, 365, 12)';
t = [1 32 60 91 121 152 182 213 244 274 305 335]';
T=365; w = 2*pi/T;
tgraf = linspace(1, 365)';
y = [6.2, 8.1, 10.6, 12.9, 15.5, 18.1, 18.5, 16.3, 14.0, 11.5, 8.6, 6.6]';
A = [ones(size(t)), cos(w*t), sin(w*t)];

c = A\y;
pgraf = c(1) + c(2)*cos(w*tgraf) + c(3)*sin(w*tgraf);
june6 = c(1) + c(2)*cos(w*156) + c(3)*sin(w*156);
dec24 = c(1) + c(2)*cos(w*357) + c(3)*sin(w*357);


r = y - A*c;
subplot(2, 2, 1)
plot(t, y, "o", tgraf, pgraf)
subplot(2, 2, 2), plot(t, r)
disp(["Trigonometrisk mätning" "6 of June" "24 of Dec" "Norm";
"nr1" june6 dec24 norm(r)])



