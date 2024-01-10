function test_Forward_velocity()
global dt
tol = 1e-4;
T = 1e5;
y = Forward_velocity(T);
t = 1:T;
t = t*1e-5;
plot(t,y)
xlabel('Second')
ylabel('Velocity')
for i = 2:length(y)
    if (abs((y(i)-y(i-1))/dt) < tol)
        terminal_velocity = y(i);
        break
    end
end
if (abs(terminal_velocity - (-9.2113)) < tol)
    fprintf('True')
else
    error('False')
end

