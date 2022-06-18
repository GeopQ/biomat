

A = 0.1;
k = -0.6;
h = 0.2;
tspan = [0 2.7];
n = 40;
p = linspace(0, 2*pi,n);
r = 0.005;
point = 4.2857;

for i = 1:n
    [t, y] = ode45(@(t,y) odefcn(t,y,A,k,h), tspan, [point + r*sin(p(i)), point + r*cos(p(i))]);
    
    hold on
    n_q = numel(y(:,1));
  
           
    
           step = 2;
           n_q = fix(n_q/step)*step;
    
            for l = 1:step:n_q - step
                 leng = ((y(l - 1 + step,1) - y(l,1)).^2 + (y(l - 1 + step,2) - y(l,2)).^2).^(1/2);
                 q = quiver(y(l,1),y(l,2),(y(l - 1 + step,1) - y(l,1))/leng,(y(l - 1 + step,2) - y(l,2))/leng,'Color','blue'); 
                 %q.LineWidth = 1;
            end    
   
            plot(y(:,1),y(:,2),'b');
            %plot(point,point,'r.','MarkerSize',20);
            plot(0,0,'r.','MarkerSize',20);
   hold off 
end

%%
A = 0.3;
k = -0.2;
h = 0.4;
L = A*k + h;
M = -k./(A*k + h);
disp(L);
disp(M);
%%

function dydt = odefcn(t,y,A,k,h)
dydt = zeros(2,1);
dydt(1) = (y(1).^2 - y(1).*y(2))./(1 + A.*y(1));
dydt(2) = k.*y(2) + (h.*y(1).*y(2))./(1 + A.*y(1));
end