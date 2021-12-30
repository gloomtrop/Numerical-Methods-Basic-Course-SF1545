clear, close
clc

T0 = 310; Tn = 460;
t0 = 0; tn = 3.3;
L = 3.3; n = 16; N = n - 1;h = L/N; 
jump = 1; valY1 = 450;Etrunk1 = 1; 
i = 1;
 
while abs(Etrunk1) > 10^-7
    
    h = L/N;  
    t = h*[1:N];
    
    A = [(3/h^2 + t./(5*h^2) - 1/(10*h))', (-(6/h^2 + 2*t./(5*h^2)))', ((3/h^2 + t./(5*h^2)+ 1/(10*h)))'];
    k1 = - Qeq(t(1), L) - (3/h^2 + t(1)/(5*h^2) - 1/(10*h))*T0;
    k2 = - Qeq(t(2:N-1), L);
    k3 = - Qeq(t(N), L) - (3/h^2 + t(N)/(5*h^2) - 1/(10*h))*Tn;
    k = [k1 k2 k3]';
    V = spdiags(A, -1:1, N, N);
    
    
    T = V\k;
    
    index = find(t==1.76);
    valY = T(index);
    
    Etrunk = valY - valY1;
    kvot = Etrunk1/Etrunk
    Etrunk1 = Etrunk; valY1 = valY + Etrunk/3; 
%     N = 2*N;
    
    
%     for j = 1:N
%         if j == 1
%             vmid = -(6/h^2 + 2*t(j)/(5*h^2));
%             vtop = (3/h^2 + t(j)/(5*h^2)+ 1/(10*h));
%             V(j, j) = vmid;
%             V(j, j+1) = vtop;
%             b(j) = - Qeq(t(j), L) - (3/h^2 + t(j)/(5*h^2) - 1/(10*h))*T0;
%         
%         elseif j == N
%             vned = 3/h^2 + t(j)/(5*h^2) - 1/(10*h);
%             vmid = -(6/h^2 + 2*t(j)/(5*h^2));
%             V(j, j) = vmid;
%             V(j, j-1) = vned;
%             b(j) = - Qeq(t(j), L) - (3/h^2 + t(j)/(5*h^2) - 1/(10*h))*Tn;
%         
%         else
%         
%             vned = 3/h^2 + t(j)/(5*h^2) - 1/(10*h);
%             vmid = -(6/h^2 + 2*t(j)/(5*h^2));
%             vtop = (3/h^2 + t(j)/(5*h^2) + 1/(10*h));
%             V(j,j) =  vmid;
%             V(j,j-1) = vned;
%             V(j, j+1) = vtop;
%             b(j) = - Qeq(t(j), L);
%         end
%         
%    
%     end
    
%     V = sparse(V);
%     y = V\b;
%     
%     index = find(t==1.76);
%     valY = y(index);
%     
%     Etrunk = valY1 - valY
%     kvot = Etrunk1/Etrunk
%     Etrunk1 = Etrunk; valY1 = valY; 
%     N = 2*N;
        
end

% deltah = diff(hv); kvoth = deltah(1:end-1)./deltah(2:end)
% delta = diff(Y);
% kvot = delta(1:end-1)./delta(2:end)
% plot(t, y, 1.76, y(index), "O");
T(index)

