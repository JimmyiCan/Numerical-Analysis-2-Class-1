function test_zeta()
N = 1e5;
i = 0;
for n = 1:10:N
    error(n) = abs(CRzeta(n) - (pi.^4)/90);
    i = i + 1;
    err(i) = error(n);
end
n = 1:10:N;
n = log(n)/log(10);
err = log(err)/log(10);
plot(n,err,'O')
xlabel('n')
ylabel('Error')

loglog