clear; close all; clc

%% Test pulse  
A=1; I=1; td_test=0;
t = (-5:0.01:5)';

for i=1:length(t)
    f(i) = impulse(t(i),0,A,I);
end

figure(1)
plot(t,f,'r','LineWidth',2)
xlabel('time'); ylabel('Intensity'); title('Rectangular pulse')
grid on


%% initial conditions/discterization (time span)
x0=0.8;
y0=0.6;

in_cond=[x0 y0];

t_first=0;
t_last=60;

tot_steps=1e3;
dt=(t_last-t_first)/tot_steps;

tspan = t_first:dt:t_last;

%% ode1

[ti_1,yi_1]=ode45(@ode1,tspan,in_cond);

figure(2)
plot(ti_1,yi_1(:,1))
hold on
plot(ti_1,yi_1(:,2))
hold off
xlabel('time'); ylabel('x,y'); title('time field'); legend('x','y');

figure(3)
plot(yi_1(:,1),yi_1(:,2))
xlabel('x'); ylabel('y'); title('phase field');


%% ode2

[ti_2,yi_2]=ode45(@ode2,tspan,in_cond);

figure(4)
plot(ti_2,yi_2(:,1))
hold on
plot(ti_2,yi_2(:,2))
hold off
xlabel('time'); ylabel('x,y'); title('time field'); legend('x','y');

figure(5)
plot(yi_2(:,1),yi_2(:,2))
xlabel('x'); ylabel('y'); title('phase field');

%% ode3

[ti_3,yi_3]=ode45(@ode3,tspan,in_cond);

figure(6)
plot(ti_3,yi_3(:,1))
hold on
plot(ti_3,yi_3(:,2))
hold off
xlabel('time'); ylabel('x,y'); title('time field'); legend('x','y');

figure(7)
plot(yi_3(:,1),yi_3(:,2))
xlabel('x'); ylabel('y'); title('phase field');

%% range of initial conditions

x0=-1:0.2:1;
y0=-1:0.2:1;

t_first=0;
t_last=50;

tot_steps=50;
dt=(t_last-t_first)/tot_steps;

tspan2 = t_first:dt:t_last;
z=zeros(size(tspan2))';
w=gradient(tspan2)';
scale = 0.5;
%% ode1 
figure(8)
for i=1:length(x0)
    for j=1:length(y0)
        
        in_cond=[x0(i) y0(j)];
        [ti,yi]=ode45(@ode1,tspan2,in_cond);

        u=gradient(yi(:,1));
        v=gradient(yi(:,2));

        quiver(yi(:,1),yi(:,2),u,v,scale,'r')
        hold on

    end
end
hold off
xlabel('x'); ylabel('y'); title('quiver plot over different initial conditions');

td=30;
A=1; I=1;

t1=td-A/2; 
t2=td+A/2; 

figure(9)
plot3(yi_1(1,1),yi_1(1,2),tspan(1),'k')
hold on
box on
grid on
axis tight 
for i=1:length(tspan)
    figure(9)
    hold on
    if tspan(i)<t1
        plot3(yi_1(i,1),yi_1(i,2),tspan(i),'*k')
    else
        plot3(yi_1(i,1),yi_1(i,2),tspan(i),'*r')
    end
end
xlabel('x'); ylabel('y'); zlabel('time');



%% ode2
figure(10)
for i=1:length(x0)
    for j=1:length(y0)
        
        in_cond=[x0(i) y0(j)];
        [ti,yi]=ode23t(@ode2,tspan2,in_cond);

        u=gradient(yi(:,1));
        v=gradient(yi(:,2));

        quiver(yi(:,1),yi(:,2),u,v,scale,'r')
        hold on

    end
end
hold off
xlabel('x'); ylabel('y'); title('quiver plot over different initial conditions');

figure(11)
plot3(yi_2(1,1),yi_2(1,2),tspan(1),'k')
hold on
box on
grid on
axis tight 
for i=1:length(tspan)
    figure(11)
    hold on
    if tspan(i)<t1
        plot3(yi_2(i,1),yi_2(i,2),tspan(i),'*k')
    else
        plot3(yi_2(i,1),yi_2(i,2),tspan(i),'*r')
    end
end
xlabel('x'); ylabel('y'); zlabel('time');

%% ode3
figure(12)
for i=1:length(x0)
    for j=1:length(y0)
        
        in_cond=[x0(i) y0(j)];
        [ti,yi]=ode45(@ode3,tspan2,in_cond);

        u=gradient(yi(:,1));
        v=gradient(yi(:,2));

        quiver(yi(:,1),yi(:,2),u,v,scale,'r')
        hold on

    end
end
hold off
xlabel('x'); ylabel('y'); title('quiver plot over different initial conditions');

td=44;
A=1; I=1;

t1=td-A/2; 
t2=td+A/2; 

figure(13)
plot3(yi_3(1,1),yi_3(1,2),tspan(1),'k')
hold on
box on
grid on
axis tight 
for i=1:length(tspan)
    figure(13)
    hold on
    if tspan(i)<t1
        plot3(yi_3(i,1),yi_3(i,2),tspan(i),'*k')
    else
        plot3(yi_3(i,1),yi_3(i,2),tspan(i),'*r')
    end
end
xlabel('x'); ylabel('y'); zlabel('time');