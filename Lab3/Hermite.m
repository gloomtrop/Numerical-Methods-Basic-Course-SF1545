function [py, px ]= Hermite(Yut)
xVal = Yut(:,1); yVal = Yut(:,3);
    yprimVal = Yut(:,4);xprimVal = Yut(:,2);
    px = [];
    py = [];
    %HERMITEINTERPOLATION VID X = 1,...,15
    for k=1:15
        yprimPoi = [];
        for j=2:length(xVal) - 1
            if xVal(j)>k
                xPoi1 = xVal(j-1);
                xPoi2 = xVal(j);
                yPoi1 = yVal(j-1);
                yPoi2 = yVal(j);
                yprimPoi(1) = yprimVal(j-1)/xprimVal(j-1);
                yprimPoi(2) = yprimVal(j)/xprimVal(j);

                break
            end
        end
       %VANLIG INTERPOLATION
        xP = [xPoi1;xPoi2]; yP = [yPoi1;yPoi2];
        A = [ones(size(xP)) xP]; c = A\yP;
        pxk = c(1) + c(2)*k;
        px(k) = pxk;
        
       %HERMITEINTERPOLATION
        hi =  xPoi2 - xPoi1;
        ci = (yPoi2 - yPoi1)/hi;
        ki1 = yprimPoi(1); 
        ki2 = yprimPoi(2);
        pyh = yPoi1 + ci*(k-xPoi1) + (k-xPoi1)*(k-xPoi2)*((ki2 - ci)*(k-xPoi1) + (ki1 -ci)*(k-xPoi2))/hi^2;
        py(k) = pyh;
    end
end

