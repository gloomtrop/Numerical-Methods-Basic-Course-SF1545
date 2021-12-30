clear all, close all;

x=[0 5 0 3.5 3 0]; y=[0 2.8 3.3 0 5 0];

for i = 1:30
    hold on
    normX = 60*rand; xK = normX + x;
    normY = 45*rand; yK = normY + y;
    if i <= 15
        fill(xK, yK, "y")
    else
        plot(xK, yK, "k")
    end
    
    
end


axis equal