function [Tut, Yut, vinkel1, steg] = GissaVF(v0,vinkel0,vinkel1, tspan)

    [Tut ,Yut, fel0] = felfunkF(@dudxF,v0,vinkel0, tspan);
    
    t = 1;
    t1 = 1; t2 = 1; 
    Yn1 =ones(size(4,1));
    Etrunk1 = 1;
    while abs(t)>1e-9
        [Tut, Yut, fel1, steg] = felfunkF(@dudxF,v0,vinkel1, tspan);
        v = [vinkel0 vinkel1]';fel = [fel0 fel1]';
        [pf , ~, mu] = polyfit(v, fel,1);
        vinkel0 = vinkel1;
        vinkel1 = fzero(@(v)polyval(pf,v, [], mu), 0);
        t = vinkel1-vinkel0;
        
        fel0 = fel1;
        t1= t1+1;
        
        %RUNGEKUTTAKVOT
        Yn0 = Yut(steg,:);
        Etrunk = abs(Yn0-Yn1);
        kvotRK = Etrunk1./Etrunk;
        Etrunk1 = Etrunk; Yn1 = Yn0;
        
    end

end