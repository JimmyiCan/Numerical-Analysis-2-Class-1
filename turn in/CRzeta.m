function y = CRzeta(n)
% y(0) = 0;
% for i = 1:n
%     y(i) = y(i-1) + 1/(n.^4);
% end

i = 1:n;
x(i) = i.^(-4);
xsums = cumsum(x);
y = xsums(1:1:length(x));
y = y(n);
