clear, close
clc

L = 4.1; nG = 1000; n =100; 
xG = linspace(0,L, nG); yG = fexp(xG);
t2 = 1; Ttak2 = 1;
fi = 0:2*pi/30:2*pi;
Etrunk1 = 1; EtrunkT1 = 1;


for i=1:5
    h = L/n;
    x = 0:h:L;
    y = pi*(fexp(x)).^2;
    t1 = h*(sum(y) - (y(1) + y(n+1))/2);
    Ttak1 = t1 + (t1-t2)/3;
    
    Etrunk = t1 - t2;
    EtrunkT = Ttak1 - Ttak2;
    kvot = Etrunk1/Etrunk;
    kvotTak = EtrunkT1/EtrunkT;
    disp(["Etrunk" "EtrunkT" "kvot" ;"kvotTak" "Trapets" "TrapetsTak" ])
    disp([ abs(Etrunk) abs(EtrunkT) kvot; kvotTak t1 Ttak1])
                    
    t2 = t1;Ttak2 = Ttak1;
    Etrunk1 = Etrunk; EtrunkT1 = EtrunkT;
    n = 2*n;
    
    
end



X = x'.*ones(size(fi)); Y = y'*cos(fi); Z = y'*sin(fi);

subplot(2,1,1), mesh(X, Y, Z), hold on
subplot(2,1,2), plot(xG, yG);

