%log_cobweb.m
%This is a script to iterate the logistic map for various parameter values
%You should only need to edit the first block of code

%This controls how many iterations you compute
N = 500;
%this is the inital value of the model
x0 = 0.5;
%And the parameter
r = 0.85;

%SHOULD NOT NEED TO EDIT ANYTHING AFTER THIS

mapping = @(x) r.*sin(pi*x); %Logistic map defined as inline funct.

%getting ready to run simulations
y = [x0;x0];
z = linspace(0,1,100);
fz = mapping(z);
x = x0;
xz = [x];

%We now run forward in time until 'N'
for j = 1:N
    
    %Apply the map to our variable
    f = mapping(x);
    %Get ready for next step
    x = f;
    %add the value to 'xz' for plot #2
    xz = [xz;x];
    %Add the value to 'y' for plot #1
    y = [y;x;x];
    
end

%Here we plot the function, the line x=y, and our cobweb
figure(1)
plot(y(1:2*N+1),[0;y(3:2*N+2)],z,z,'r--', 'LineWidth',2)
hold on
plot(z,fz,'k','LineWidth',4)
hold off
set(gca,'FontSize',14)
set(gca,'YTick',[0,0.2,0.4,0.6,0.8,1])
title('Cobweb plot of sine map','FontSize',18)
xlabel('X_n','Fontsize',16)
ylabel('X_{n+1}','Fontsize',16)

%Here we will plot the time sequence of our solution
figure(2)
plot(xz,'*','MarkerSize',8,'LineWidth',2)
hold on
plot(xz,'-.','LineWidth',0.5)
hold off
set(gca,'FontSize',14)
set(gca,'YTick',[0,0.2,0.4,0.6,0.8,1])
title('Solution sequence','FontSize',18)
xlabel('n','Fontsize',16)
ylabel('X_n','Fontsize',16)
ylim([0 1])
xlim([0 N+1])