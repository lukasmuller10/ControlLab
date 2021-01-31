%considerando que ja temos y
function tau = alg6(y,A)
[ymax,i] = max(y(:,2));
ts = y(:,1);
ys = y(:,2);

%calculando yinf
indice = find(y(:,2) > 0.98*ymax);
ti = ts(indice(1):end);
yti = ys(indice(1):end);

N = length(yti);
res = 0;
for n=1:N
    res = res + yti(n);
end
yinf = (1/N)*res;

indices = find(ys < yinf); %pontos nos quais y < yinf
i = indices(end);
tr = ts(i);
ind2 = find(ys < ys(tr));
ti = ts(ind2); yi = ys(ind2);
b = [];
for i=1:length(yi)
    b = [b log(yinf/(yinf - yi(i)))];
end
a = (ti'*b)/(ti'*ti);
tau = 1/a;