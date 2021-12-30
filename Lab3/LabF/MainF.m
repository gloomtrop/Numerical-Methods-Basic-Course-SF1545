
%STARTVÄRDEN
v0 = 18;
%FOR-LOOP FÖR BERÄKNING AV VINKLAR
for i=1:2
    if i==2
        tspan = [0 3];
    else
        tspan = [0 1.9];
    end
    %VINKELSKATTNING
    vinkel0 = [pi/3 pi/10]; vinkel1 = [pi/2  pi/5];
    [Tut, Yut, vinkel1, steg] = GissaVF(v0, vinkel0(i), vinkel1(i), tspan);
    plot(Yut(:,1), Yut(:,3),Yut(:,1), 0*ones(size(Yut(:,1))) ), hold on
    t = 1;vinkel1
    
    Yut(steg, :);
    %HERMITEINTERPOLATION
    xr = 1:15;
    py = HermiteF(Yut);
    
    % disp(["-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-", "-";r;py]
end


%BERÄKNING AV BEGYNNELSEHASTIGHET
tspanV = [0 3.5];
v0 = 25; v1 = 30;
[Tut, Yut, v1, steg] = GissaHF(vinkel1, v0, v1, tspanV);
plot(Yut(:,1), Yut(:,3))
v1
