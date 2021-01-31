%quais sao as entradas?
function [c,fi]=alg2(N,y,T);
%y=[y1 y2] array retornado quando uma simulaçao eh feita no matlab

tk = y(:,1);
ftk = y(:,2);
[p,col] = size(y);

% OBS: nesse codigo foi usado um periodo de 4s para testar o codigo

%T = 4; %valor de teste
indice = find(tk == T); %pegando apenas o primeiro periodo

%H = tk(end)-tk(1)
%T = p*H 
%indice = find(tk == T)

t = tk(1:indice(1));
ft = ftk(1:indice(1));
%t=tk;
%ft=ftk;

cf = []; %variavel auxiliar
fif = []; %variavel auxiliar
a0 = trapz(t,ft)/T;

for n=1:N %calculando coeficientes da serie de fourier
    an = (2/T)*trapz(t,(cos(2*pi*n*t/T).*ft));
    bn = (2/T)*trapz(t,(sin(2*pi*n*t/T).*ft));
    zn = bn + j*an;
    cn = abs(zn) ; fin = angle(zn);
    cf = [cf cn];
    fif = [fif fin];
end
c = [a0 cf]
fi = [fif]
