clear all, close all;

set(gcf,"DoubleBuffer","on");
fi = 0:2*pi/60:2*pi;

for i = 1:10
    hold on
    xKoord = i*cos(fi); yKoord = i*sin(fi);
    plot(xKoord, yKoord, "k")
    text(0,i,int2str(11-i));
    if i == 1
        fill(xKoord, yKoord, "r")
    end
        
end

axis equal

    totalP = 0;
for pil=1:10 
    hold on
    x =5*randn; y = 4*randn;
    d = sqrt(x.^2 + y.^2);
    if d > 10
        poang = 0;
    else
        poang = 10-fix(d);
        totalP = totalP + poang;
    end
    plot(x, y,"k*")
    pause(0.7)
end
disp(totalP);