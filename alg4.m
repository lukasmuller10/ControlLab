% considerando que ja temos y (resposta ao degrau)
% e a amplitude A conhecida

%ver como achar o tempo em que chega em regime permanente

function K = alg4(y,A)
[ymax,i] = max(y(:,2));
ys = y(:,2);
ts = y(:,1);

indice = find(y(:,2) > 0.98*ymax);
ti = ts(indice(1):end);
yti = ys(indice(1):end);

N = length(yti);
res = 0;
for n=1:N
    res = res + yti(n);
end
yinf = (1/N)*res;

K = yinf/A