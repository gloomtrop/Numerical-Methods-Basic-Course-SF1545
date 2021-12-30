function [T, Y] = Rungekutta(F, tspan, u0, n)
    %STEGLÄNGEDEN
    t0 = tspan(1); tn = tspan(2);
    h = (tn - t0)/n;
    t = t0; N = 1; 
    
    %BERÄKNING AV RUNGEKUTTA
    T = [];
    Y = [];
    Y(:,1)=u0;
    while t<tn
        N = N +1;
        k1 = F(t, u0);
        k2 = F(t + (h/2),u0 +(h/2)*k1);
        k3 = F(t + (h/2),u0 +(h/2)*k2);
        k4 = F(t + h, u0 + h*k3);

        u0 = u0 +(k1 +2*k2 + 2*k3 + k4)*h/6;
        t = t +h;
        Y(:,N)=u0;
        T(1,N)=t;
    end
    Y = Y';T = T';
end

