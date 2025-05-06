function fiegen(rmin,rmax)


h = (rmax - rmin)/10000;

r = [rmin:h:rmax];
y = []

for i = 1:length(r)
    
    x = getcycle(r(i));
    
    y = [y,x];
    
end

figure(96)
clf(96)
hold on
for i = 1:length(y(:,1))
    
    plot(r,y(i,:),'LineWidth',2.5)
    

end

set(gca,'FontSize',14)
xlabel('r','FontSize',16,'FontWeight','bold')
ylabel('Long term behavior of x_n','FontSize',16,'FontWeight','bold')
end






function x = getcycle(r)


cur = 0.333;
x = [];

for j = 1:10000

   %If you want to change the iterated map that we are analyzing, you
   %change this one line right here. 
   % 'r' is the bifurcation parameter
   % 'cur' is the x_n variable
   % 'next' is the x_{n+1} variable
   next = r*sin(pi*cur);
   cur = next;
end



for j = 1:128
    
    %IMPORTANT!!!!!!!
    %WHATEVER CHANGE YOU MAKE ABOVE ON LINE 44, YOU NEED TO MAKE THE SAME
    %CHANGE HERE AS WELL!!!!!!!!!
    next = r*sin(pi*cur);
    cur = next;
    x = [x;cur];
    
end

x = sort(x);

end