function f = dvdt(v)
m = 80;
g = 9.8;
rho = 1.2;
A = 14;
C = 1.1;
f = -g + 1/(2*m)*rho*v.^2*A*C;