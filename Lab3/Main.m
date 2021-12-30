clear
close
Tv = zeros(6, 6);
Tb = Tv;
TN = zeros(1,6);
% for N=2:7
    %STARTVÄRDEN
        n = 10*2^6; v0 = 18;
%         TN(N-1) = n;
disp("Steglängd: " + num2str(n))
        %FOR-LOOP FÖR BERÄKNING AV VINKLAR
for i=1:2

    if i==2
        tspan = [0 3]';
    else
        tspan = [0 1.9]';
    end
    %VINKELSKATTNING
    vinkel0 = [pi/3 pi/10]; vinkel1 = [pi/2  pi/5];
    [Tut, Yut, vinkel1, steg] = GissaV(v0, vinkel0(i), vinkel1(i), tspan, n);
    plot(Yut(:,1), Yut(:,3)), hold on
    t = 1;vinkel1
%         Tv(N-1,i) = vinkel1;
%         Tb(N-1,i) =Yut(steg, 1);
    %HERMITEINTERPOLATION
    [py, px] = Hermite(Yut);
    r = 1:15;

end

plot(Yut(:,1), 0*ones(size(Yut(:,1))))

delta = py(end) - px(end);
% disp(r)
disp(py)    
%BERÄKNING AV BEGYNNELSEHASTIGHET
tspanV = [0 3.5]';
v0 = 26; v1 = 28;
[Tut, Yut, v1, steg] = GissaH(vinkel1, v0, v1, tspanV, n);
plot(Yut(:,1), Yut(:,3))
v1

% Tv(N-1, 3) = v1;
% Tb(N-1,3) = Yut(steg,1);

legend("Kort vinkel", "Stor vinkel", "y=0", "Motvind")



disp(["Vinkel1", "Vinkel2", "Hastighet0", "Delta V1", "Delta V2", "Delta H0"])
% TvD = diff(Tv); 
% Tv(2:end, 4) = TvD(:,1); 
% Tv(2:end,5) = TvD(:, 2); 
% Tv(2:end, 6) = TvD(:, 3); 
% 
% TbD = diff(Tb); 
% Tb(2:end, 4) = TbD(:,1); 
% Tb(2:end,5) = TbD(:, 2); 
% Tb(2:end, 6) = TbD(:, 3);
% 
% disp(Tv), disp("Steglängd"),disp(TN)



