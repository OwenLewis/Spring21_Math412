%This function will numerically integrate the Lorenz 
%equations and plot the solution in both phase space
%as well as each of the components as functions of time.
%
%Syntax:    lorenz_explore(r,sig,b,x0,y0,z0,Tmax)
%           r: parameter (Rayleigh Number)
%           sig: parameter (Prandlt Number)
%           b: parameter (unnamed)
%           x0: initial condition x-coordinate
%           y0: initial condition y-coordinate
%           z0: initial condition z-coordinate
%           Tmax: maximum time of simulation
function lorenz_explore(r,sig,b,x0,y0,z0,Tmax)


%Check to see if we're past the pitchfork bifurcation.
%Calculate the relevant fixed points accordingly. 
if r > 1
    xp = sqrt(b*(r-1));
    xm = - xp;
    zp = r-1;
else
   xp = 0;
   xm = 0;
   zp = 0;
end

%Intitial condition
start = [x0,y0,z0];

%Creating the inline function for the lorenz equations

if Tmax >= 0 
    lorenzprime = @(t,x) [sig*(x(2) - x(1));r*x(1) - x(2) - x(1)*x(3);x(1)*x(2) - b*x(3)];
    
    %Time inteval
    time = [0 Tmax];
    %Solve the ODE
    opts = odeset('RelTol',1e-12,'AbsTol',1e-14);
    [T,Y] = ode45(lorenzprime,time,start,opts);

else
    lorenzprime = @(t,x) -[sig*(x(2) - x(1));r*x(1) - x(2) - x(1)*x(3);x(1)*x(2) - b*x(3)];
    
    %Time inteval
    time = [0 -Tmax];
    %Solve the ODE
    opts = odeset('RelTol',1e-12,'AbsTol',1e-14);
    [T,Y] = ode45(lorenzprime,time,start,opts);

end

%Now we plot phase space. 
figure(1)
plot3(Y(:,1),Y(:,2),Y(:,3),'r')
hold on
plot3([xp,xm],[xp,xm],[zp,zp],'xk','LineWidth',2,'MarkerSize',12)
hold off
set(gca,'FontSize',16)
xlabel('X','FontSize',16,'FontWeight','bold')
ylabel('Y','FontSize',16,'FontWeight','bold')
zlabel('Z','FontSize',16,'FontWeight','bold')



%And now we plot the components as function of time.     
figure(3)
subplot(3,1,1)
plot(T,Y(:,1),'b','LineWidth',2.5)
hold on
plot(T,0*T+xp,'-.k','LineWidth',1.5)
legend({'Solution','Fixed Points'},'AutoUpdate','off','location','best')
plot(T,0*T+xm,'-.k','LineWidth',1.5)
hold off
set(gca,'fontsize',14)
ylabel('X(t)','FontSize',14,'FontWeight','bold')
subplot(3,1,2)
plot(T,Y(:,2),'b','LineWidth',2.5)
hold on
plot(T,0*T+xp,'-.k','LineWidth',1.5)
legend({'Solution','Fixed Points'},'AutoUpdate','off','location','best')
plot(T,0*T+xm,'-.k','LineWidth',1.5)
hold off
set(gca,'fontsize',14)
ylabel('Y(t)','FontSize',14,'FontWeight','bold')
subplot(3,1,3)
plot(T,Y(:,3),'b','LineWidth',2.5)
hold on
plot(T,0*T+zp,'-.k','LineWidth',1.5)
legend({'Solution','Fixed Points'},'AutoUpdate','off','location','best')
hold off
set(gca,'fontsize',14)
ylabel('Z(t)','FontSize',14,'FontWeight','bold')
    
    
    
end
