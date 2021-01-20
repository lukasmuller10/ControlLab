function [K, tau] = ordem1area(t,yt,A)

%Grafico de y(t)
plot(t,yt,'b*');
grid on
xlabel('t (s)')
ylabel('y')
title('t x y(t)')

%Comando que pede o click do usuario
V = ginput(1);
ts = V(1); %tempo de acomodacao

%------------------------------------------------
%Calculando o y em regime permanente
i = length(t);
soma = 0;
while t(i) > ts
    soma = soma + yt(i);
    i = i - 1;
end

N = length(t) - i;
y = soma/N;
%------------------------------------------------

%K --> primeira saida
K = y/A;

%------------------------------------------------
%Calculando a area Ao

%F --> Funcao constante f(x) = y infinito
F = zeros(1,length(yt));
F(1:end) = y;

area1 = trapz(t,F); %area abaixo de F
area2 = trapz(t,yt); %area abaixo de y(t)

Ao = area1 - area2;
%------------------------------------------------

%tau --> segunda saida
tau = Ao/y;  

end
