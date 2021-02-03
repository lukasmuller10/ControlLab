%considerando que ja temos y
function tau = alg6(y,A)
[ymax,i] = max(y(:,2));
ts = y(:,1);
ys = y(:,2);

%calculando yinf
indice = find(y(:,2) > 0.98*ymax);
ti = ts(indice(1):end);
yti = ys(indice(1):end);

tt = ts(1:indice(1));
ytt = ys(1:indice(1));

N = length(yti);
res = 0;
for n=1:N
    res = res + yti(n);
end
yinf = (1/N)*res;

% indices = find(ys < yinf); %pontos nos quais y < yinf
% i = indices(end);

% tr = ti(1);
% ind2 = find(ys < ys(indice(1)));
% ti = ts(ind2); yi = ys(ind2);

b = [];
for i=1:length(ytt)
    b = [b log(yinf/(yinf - ytt(i)))];
end
a = (tt'*b')/(tt'*tt);
tau = 1/a