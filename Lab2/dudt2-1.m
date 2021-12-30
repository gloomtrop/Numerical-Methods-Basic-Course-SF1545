function dUdt = dudt2(t,u,L)
    
    dUdt = [u(2);(265*exp(-(t-L/2).^2)+1/5*u(2))/(-(3+t./5))];
    
    
end
