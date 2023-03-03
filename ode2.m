function dxdt=ode2(t,x)

td=30;
A=1; I=1; m=1; omega=1; a1=-1; a2=10; b=0.1;

t1=td-A/2; 
t2=td+A/2; 

dxdt(1)=m*x(1)-omega*x(2)+(a1*x(1)-b*x(2))*(x(1)^2+x(2)^2)+a2*impulse(t,td,A,I);
dxdt(2)=omega*x(1)+m*x(2)+(b*x(1)+a1*x(2))*(x(1)^2+x(2)^2);

dxdt=dxdt';

end