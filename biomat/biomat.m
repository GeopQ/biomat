%u_(t+1) = r*u_t*(8 - (u_t)^3)  0 < u_t < 2

r = 0.03;
r_delta = 0.0003;
n_1 = 900;
n_2 = 300;

for i = 0:n_1 - 1
    r = r + r_delta;
    u_0 = 0.1;
    mas = [];
    for j = 1:n_2
        u_1 = r*u_0*(8 - u_0.^3);
        u_0 = u_1;
        mas = [mas, u_0];    
    end
     hold on
     plot(r*ones(1,n_2./2),mas(n_2./2:n_2 - 1),'.','Color', 'b','MarkerSize',1);
     xlabel('r');
     ylabel('u_t');
     axis([0.03 0.26 -0.1 2]);
     hold off
end
%%
f = @(u, r) r.*u.*(8 - u.^3);
g = @(u,r) 0.2083.*0.2083.*u.*(8 - u.^3).*(8 - (r.*u.*(8 - u.^3)).^3);

syms u r;
eqn1 = g == u;
eqns = [f(f(u,0.2083),0.2083) == u, diff(f(f(u,0.2083),0.2083), 'u') == 1 ];
S = solve(eqn1, u);
disp(S);


%%
f = @(u,r) r.*u.*(8 - u.^3);
drawArrow = @(x,y) quiver(x(1),y(1),x(2) - x(1), y(2) - y(1), 0, 'black','ShowArrowHead','off');
r = 0.2083;
u_1 = 1.668;
u_s = 1.418;

x1 = [u_s u_s];
y1 = [0 f(u_s, r)];

x2 = [u_s f(u_s, r)];
y2 = [f(u_s, r) f(u_s, r)];

x3 = [f(u_s, r) f(u_s, r)];
y3 = [f(u_s, r) f(f(u_s, r), r)];

x4 = [f(u_s, r) u_s];
y4 = [f(f(u_s, r), r) f(f(u_s, r), r)];

u = linspace(0,2,100);
hold on
plot(u, f(u, r.*ones(1,length(u))));
plot(u,u);
drawArrow(x1, y1);
drawArrow(x2, y2);
drawArrow(x3, y3);
drawArrow(x4, y4);
xlabel('u');
ylabel('f(u)');
hold off
%%
f = @(u,r) 8.*r - r.*4.*u.^3;
g = @(u,r) r.*u.*(8 - u.^3);
r = 0;
r_delta = 0.0005;
n_1 = 1500;
n_2 = 1000;

for i = 0:n_1 - 1
    r = r + r_delta;
    u_0 = 0.01;
    mas = [];
    sum = 0;
    
    for j = 1:n_2
        u_1 = g(u_0,r);
        u_0 = u_1;
        sum = sum + log(abs(f(u_0,r)));
        
    end
    sum = sum./n_2;
     hold on
     plot(r,sum,'.','Color', 'b','MarkerSize',3);
     xlabel('r');
     ylabel('h(r)');
     
     hold off
end
    hold on
    plot([0, 3],[0, 0],'Color','black','MarkerSize',5);
    axis([0 0.26 -6 2.63]);
    hold off

%%
syms x;
eqn = (1 + (13 - 96*x)^1/2)/2 == 1;
S = solve(eqn);
disp(S);
%%
r_b = 4/19;
v = @(u) r_b.*u.*(8 - u.^3);
u_x = 1.47:0.001:1.49;
v_y = v(u_x);
disp(size(u_x));
plot(u_x,v_y,'.');
%%
eps = 1/1000;
r = 1/6 + eps;
u_t_1 = @(u_t, u_mt) r.*u_t.*(8 - u_mt.^3);
u_0_0 = 1.2599;%1.2599
u_0_1 = 1.2599;
n = 1000;
mas_x = [];
mas_y = [];
for i=1:n
   u_1 = u_t_1(u_0_1,u_0_0);
   mas_x = [mas_x, u_0_0];
   mas_y = [mas_y, u_0_1];
   disp(u_0_0);
   disp('___');
   disp(u_0_1);
   disp(i);
   disp('aaaaaaaaaaaaaaaaaaaa');
   u_0_0 = u_0_1;
   u_0_1 = u_1;
   
end    
   hold on
   plot(mas_x, mas_y,'.','Color','b','MarkerSize',7);
   hold off
   xlabel('v');
   ylabel('u');
%%
f = @(u, r) r.*u.*(8 - u.^3);
r = 1.2;
u_0 = 0.1;
for i=1:300
    u_1 = f(u_0,r);
    disp(u_1);
    u_0 = u_1;
end    
%%
r = 0.2645;
f = @(u) abs(r.*u.*(8 - u.^3));
x = linspace(0,2,100);
plot(x,f(x));
xlabel('u');
ylabel('f(u,r_l)');

