function [K, tau] = ordem1areaneperiano(t,yt,A)
%(ax = b) metodo do logaritmo neperiano

%Grafico de y(t)
plot(t,yt,'b*');
grid on
xlabel('t(s)')
ylabel('y')
title('grafico t x y(t)')

%click do usuario
v = ginput(1);
tempoacomodacao = v(1);

%calculando o y em regime permanente
i = length(t);
soma = 0;
while t(i) > tempoacomodacao
    soma = soma + yt(i);
    i = i - 1;
end

N = length(t) - i;
y = soma/N;
K = y/A; %K

%calculando 

i = 1;
while t(i) < tempoacomodacao
    x(1,i) = t(i);
    b(1,i) = yt(i);
    i = i + 1;
end

a = dot(x',b)/norm(x)^2;

tau = 1/a; %tau

end
