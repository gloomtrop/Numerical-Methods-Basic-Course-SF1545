
%Projekt 3 - Uppgift D: Kulstötning

tend=2;
Y0=[-1;0];
options = odeset("AbsTol",1e-12,"RelTol", 1e-12);
[tutsol,Xutsol] = ode45(@myF, [0,tend], Y0, options);
N=2;
M=13;
solrk = zeros(M,2);
Nvec = zeros(M,1);
Etrunk1 = 1;
Yn1 = ones(size(4,1));
for n = 1:M
    Nvec(n)=N;
    [tut,Yut] = rungekutta(@myF,[0 tend],Y0,N);
    solrk(n,:) = Yut(end,:);
    Yn0 = Yut(end,:);
    Etrunk = abs(Yn0-Yn1);
    kvotRK = Etrunk1./Etrunk
    Etrunk1 = Etrunk; Yn1 = Yn0;
    N = 2*N;
end 

err = abs(solrk - Xutsol(end,:));
figure(1)
loglog(Nvec,err(:,1),"c-")
hold on
loglog(Nvec, err(:,2),"m--")
loglog(Nvec,Nvec.^(-4),"r-")
hold off

function[T,Y, kvot] = rungekutta(F,tspan,Y0,N)

t0 = tspan(1);
tend = tspan(2);

dt = (tend-t0)/N;
T = zeros(N+1,1);
Y = zeros(length(Y0),N+1);
%Begynnelsedata exempel problem
Y(:,1)=Y0;
t=t0;
dt2=dt/2;
n=1;

while t < tend
    n=n+1;
    K1=F(t,Y0);
    K2=F(t+dt2,Y0+dt2*K1);
    K3=F(t+dt2,Y0+dt2*K2);
    K4=F(t+dt,Y0+dt*K3);
    %Compute next approximation
    Y0=Y0+(K1+2*K2+2*K3+K4)*dt/6;
    %
    Y(:,n)=Y0;
    t=t+dt;
    T(n)=t;

end
Y=Y'; %To compare with ode45. May skip. 
end 
    

%Exempel
function[Fvals]=myF(t,Y)
Fvals=[Y(2);Y(1)];
end

