function x = alg1(p,n);
b = p(:,2); % pegando apenas as coordenadas y
[L,c] = size(p); %pegando a quantidade de linhas e colunas da matriz p contendo os pontos
cont = 0; 
grau = n;
for i=1:L %for utilizado para verificar se o ponto (0,0) eh um dos pontos escolhidos
    teste1 = p(i,1);
    teste2 = p(i,2);
    if teste1 == 0 & teste2 == 0;
        cont = cont+1;
    end
end

A = ones(L,n); %definindo a matriz A contendo apenas 1's
for i=1:L
    for j=1:n
        if grau == 0;
            grau = n;
        end
        A(i,j) = p(i,1)^grau; %definindo os elementos da matriz A
        grau = grau-1;
    end
end

if cont ~= 0; %se (0,0) for um dos pontos a serem ajustados
    xp = inv((A'*A))*A'*b;
    x = [xp;0]
else %se (0,0) não for um dos pontos a serem ajustados
    A(:,n+1) = 1;
    x = inv((A'*A))*A'*b
end