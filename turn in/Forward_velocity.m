function y = Forward_velocity(T)
global dt
y(1) = 0;
dt = 1e-4;
for i = 2:T
    y(i) = y(i-1) + dvdt(y(i-1))*dt;
end
