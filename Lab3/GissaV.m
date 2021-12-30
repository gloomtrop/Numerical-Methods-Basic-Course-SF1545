function [Tut, Yut, vinkel1, steg] = GissaV(v0,vinkel0,vinkel1, tspan, n)

    [Tut ,Yut, fel0] = felfunk(@dudx,v0,vinkel0, tspan, n);
    
    t = 1;
    t1 = 1; t2 = 1; 
    Yn1 =ones(size(4,1));
    Etrunk1 = 1;
%     disp("Vinkel")
    while abs(t)>1e-9
        [Tut, Yut, fel1, steg] = felfunk(@dudx,v0,vinkel1, tspan, n);
        t = fel1*(vinkel1-vinkel0)/(fel1 - fel0);
        fel0 = fel1; vinkel0 = vinkel1;
        vinkel1 = vinkel1 - t;
        kvot = t/(t1*t2);
        t1= t1+1;
        
        %RUNGEKUTTAKVOT
        Yn0 = Yut(steg,:);
        Etrunk = abs(Yn0-Yn1);
        kvotRK = Etrunk1./Etrunk;
        Etrunk1 = Etrunk; Yn1 = Yn0;
    end
    
    
end

