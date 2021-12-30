function [Tut, Yut,v1, steg] = GissaH(vinkel1, v0, v1,tspanV, n)

[Tut ,Yut, fel0V] = felfunk(@dudxV, v0,vinkel1, tspanV, n);
    t = 1;
    Yn1 =ones(size(4,1));
    Etrunk1 = 1;
%     disp("Hastighet")
    while abs(t)>1e-9
        [Tut, Yut, fel1V, steg] = felfunk(@dudxV,v1, vinkel1,tspanV, n);
         t = fel1V*(v1-v0)/(fel1V - fel0V);

         fel0V = fel1V; v0 = v1;
         v1 = v1 - t;
         
         
         Yn0 = Yut(steg,:);
        Etrunk = abs(Yn0-Yn1);
        kvotRK = Etrunk1./Etrunk;
        Etrunk1 = Etrunk; Yn1 = Yn0;
    end 
    
end

