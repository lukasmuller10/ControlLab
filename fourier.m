function [ao,cn,phin,y] = fourier (t,ft,N)
%Calcula os parametros da serie de fourier de uma funcao.
%Tambem coloquei para ela retornar o y de forma a facilitar a construcao do
%grafico.

T = t(2) - t(1) %Periodo
wo = 2*pi/T
X = linspace(t(1),t(2),T*10000); %Pontos no eixo x
Y = ft(X);                     %Pontos de f(x)

ya = @(n) ft(X).*cos(X*wo*n);   %Integrando de an
yb = @(n) ft(X).*sin(X*wo*n);   %Integrando de bn

ao = 1/T *trapz(Y)

%Vetor com valores de an
for n = 1:N
    an(n) = 2/T * trapz(ya(n));
end

%Vetor com valores de bn
for n = 1:N
    bn(n) = 2/T * trapz(yb(n));
end

cn = sqrt(an.^2 + bn.^2);
phin = angle(bn + an.*j);

x = linspace(t(1),t(2),10000);
y = zeros(1,length(x));
for i=1:length(x)
    for n=1:N
        y(i) = y(i) + cn(n)*sin(n*wo*x(i)+phin(n));
    y(i) = y(i) + ao;   
    end    
end

display(cn);display(phin);