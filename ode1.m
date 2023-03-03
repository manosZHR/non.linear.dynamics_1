function dxdt=ode1(t,x)

td=30;
A=1; I=1; k=1; a2=1/2;

t1=td-A/2; 
t2=td+A/2; 

dxdt(1)=x(2);
dxdt(2)=-k*x(1)+a2*impulse(t,td,A,I);

dxdt=dxdt';

end