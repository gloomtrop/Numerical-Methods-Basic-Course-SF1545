

L = 3.3;
n = 14;
temp1 = 300;
punkt=4; T0 = 310; Tn = 460;
Etrunk = 1;Etrunk1 =1 ;
while abs(Etrunk) > 10^-7
    temp2 = temp1;
    h = L/(n+1);
    x = (0:h:L)';
    x2 = x(2:end-1);
    x3=x(3:end-2);
    
    k1 = 265.*exp(-(x2(1)-(L/2)).^2)-((3+x2(1)./5)/(h^2)-1/(10*h))*T0;
    k2 = (265*exp(-(x3-L/2).^2))';
    k3 = 265.*exp(-(x2(n)-(L/2)).^2)-((3+x2(n)./5)/(h^2)+1/(10*h))*Tn;   
    b = [k1 -k2 k3]';

    T1 = @(x)(3+x./5-1/10*h)/(h^2);
    T2 = @(x)-(6+2*x./5)/(h^2);
    T3 = @(x)(x./5+3+1/10*h)/(h^2);

    A = [T1(x(3:end)) T2(x2) T3(x(1:end-2))];
    A = spdiags(A,-1:1,n,n);
    T = A\b;
    punkt=2*punkt;
    temp1 = T(punkt);
    Etrunk = abs(temp1 - temp2);
    kvot = Etrunk1/Etrunk
    n = 2*n+1; Etrunk1 = Etrunk;temp2 = temp1;
end

disp(["temp", temp1])


