function [p] = 1-minimosquadrados(x,y,n)
%Funcao pedida na 3.1

b = y'; %vetor com y's

%Saber se o ponto (0,0) esta presente
for i=1:length(x)
    if x(i)==y(i) && x(i)==0 %Caso em que o ponto (0,0) esta presente
        pres=1;    
        break
    else 
        pres=0;
    end
    
end

if pres==1
    fim=n;
else
    fim=n+1;
end

%matriz A com os x's
for i=1:length(x)
    for j=1:fim;
        A(i,j) = x(i)^(n+1-j);
    end
end

%Vetor com os coeficientes do polinomio
p = inv(A'*A)*(A')*b;



if pres==1
    p = [p' 0];
else
    p=p';
end


end
