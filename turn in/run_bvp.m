function run_bvp()
global k
k = pi/5;
[x, y] = bvp(0,0);
y = (1e-3)*y;
plot(x, y)
hold on
k = 2*pi/5;
[x, y] = bvp(0,0);
y = (1e-3)*y;
plot(x, y)
k = 3*pi/5;
[x, y] = bvp(0,0);
y = (1e-3)*y;
plot(x, y)
k = 4*pi/5;
[x, y] = bvp(0,0);
y = (1e-3)*y;
plot(x, y)
hold off
legend('Mode 1','Mode 2','Mode 3','Mode 4')
title('First Four Modes of Vibrating String','FontSize',16)
