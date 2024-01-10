function test_byp()
global k
tol = 1e-4;

for n = 1:4
    k = n*pi/5;
    [x, y] = bvp(0,0);
    y = (1e-3)*y;
    A = max(y);
    f = A*sin(k.*x);
    for i = 1:length(x)
        if (abs(y(i)-f(i)) >= tol)
            disp(i)
            disp(abs(y(i)-f(i)))
            error('The difference is too large!')
        end
    end
end
fprintf('The difference is small.')