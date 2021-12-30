function [Tut, Yut,v1, steg] = GissaHF(vinkel1, v0, v1,tspanV)


[Tut ,Yut, fel0V] = felfunkF(@dudxVF, v0,vinkel1, tspanV);
    t = 1; t2 = 1;
    Etrunk1 = 1;
    %HÄR KAN FELSKATTNING GÖRAS
    while abs(t)>1e-9
        [Tut, Yut, fel1V, steg] = felfunkF(@dudxVF,v1, vinkel1,tspanV);
        v = [v0 v1]';fel = [fel0V fel1V]';
        [pf , ~, mu] = polyfit(v, fel,1);
        v0 = v1;
        v1 = fzero(@(v)polyval(pf,v, [], mu), 0);
        t = v1-v0;
        
        fel0V = fel1V;
        

        % FEL KVOT: SKA VARA tn/(tn-1*tn-2)
        Etrunk = v1-v0; kvot = Etrunk1/Etrunk;
        Etrunk1 = Etrunk;
    %      n = 2*n;
        t2 = t2 +1;

    end
end
