%consideramos que ja temos y e A

function tau = alg5(y,A)
[ymax,i] = max(y(:,2));
ts = y(:,1);
ys = y(:,2);

indice = find(y(:,2) > 0.98*ymax);

t = ts(1:indice(1));
yt = ys(1:indice(1));

%calculando yinf:
yinf_i = ys(indice(1):end);
N = length(yinf_i);
res = 0;
for n=1:N
    res = res + yinf_i(n);
end
yinf = (1/N)*res;

a0 = trapz(t, yinf*ones(size(yt)) - yt)
tau = a0/yinf -1