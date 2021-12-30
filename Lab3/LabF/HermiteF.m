function pph = HermiteF(Yut)
xVal = Yut(:,1); yVal = Yut(:,3);
    yprimVal = Yut(:,4);
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

                break
            end
        end
        p = polyfit([xPoi1 xPoi2], [yPoi1 yPoi2],1);
        pval = polyval(p, k);
        py(k) = pval;
        ph = pchip([xPoi1 xPoi2], [yPoi1 yPoi2]);
        pval = ppval(ph, k);
        pph(k) = pval;
    end
    
    py(15) - pph(15);
end