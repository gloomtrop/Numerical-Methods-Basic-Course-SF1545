clear



x = [4 10 8]'; y = [8 2 7]'; c = [4 2 6]'; normt=1;
xl =  [4 10 8 2 1]'; yl = [8 2 7 9 5]'; 
% x = [-1 1]';

t = 1; it = 0; maxit = 10;
% while norm(t)>10^-9 

input = input("Vilken del?");
if input==4
    xl(3) = xl(3)*3;yl(3) = yl(3)*3;
end
while normt> 0.5*10^-5 && it< maxit
    
    a = c(1); b = c(2); R= c(3);
    f = (x - a).^2 + (y - b).^2 - R.^2;
    dfdx= -2*(x-a); dfdy= -2*(y-b);dfdR= [-2*R;-2*R;-2*R];
    
    if input == 2
        f(3) = 3*(x(3) - a).^2 + 3*(y(3) - b).^2 - 3*R.^2;
        dfdR(3) = dfdR(3)*3;
        dfdx(3) = dfdx(3)*3; 
        dfdy(3) = dfdy(3)*3;
    end
    if input ==3
        a = c(1); b = c(2); R= c(3);
        f = (xl - a).^2 + (yl - b).^2 - R.^2;
        dfdx= -2*(xl-a); dfdy= -2*(yl-b);dfdR= [-2*R;-2*R;-2*R;-2*R;-2*R];
       
    end
    
    if input ==4
        
        a = c(1); b = c(2); R = c(3);
        f = (xl - a).^2 + (yl - b).^2 - R.^2;
        dfdx= -2*(xl-a); dfdy= -2*(yl-b);dfdR= [-2*R;-2*R;-2*R;-2*R;-2*R];
    end
        
    J = [dfdx dfdy dfdR];
    
    
    
    t=-J\f;
    
    tnorm=norm(t, Inf)

    c = c+t; it= it +1;
    
end
if input == 3
    fi = 0:2*pi/60:2*pi;
    xK = a + R*cos(fi); yK = b + R*sin(fi);
    xlold = xl; ylold = yl;
    plot(xK, yK, a,b,"o", xlold, ylold, "Or"), axis equal, hold on
end
if input == 4
    fi = 0:2*pi/60:2*pi;c(3) = abs(c(3));
    xK = a + R*cos(fi); yK = b + R*sin(fi);
    plot(xK, yK, a,b,"*", xl, yl, "Ob"), axis equal, hold on
end
losn = c
    