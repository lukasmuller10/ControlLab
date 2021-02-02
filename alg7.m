function [K, tau] = alg7(wk,gjwk);
w = wk;
gjwdb = 20*log10(gjwk);
%subplot(1,3,1)
%semilogx(w,gjwdb,'+')
%hold on
wbaixa = 5;
indice = find(w <= wbaixa)
wi = w(indice);
p = [wi gjwdb];
pontos = alg1(p,0);
Kdb = ones(1,length(indice))*pontos(1);
%subplot(1,2,2)
%semilogx(wi,Kdb,'*')
%hold on
ww = logspace(w(1),w(end),200);
filterjw = [];
gww = [];
%calculando erro medio quadratico para cada valor de n, utilizado no metodo
%dos minimos quadrados
for n = 0:1:20
    matriz = [ww gjwdb];
    g = alg1(matriz,n);
    gww = polyval(g,ww);
    %subplot(2,1,3)
    semilogx(ww,gww);
    for i = 1:1:length(w) %pegando os valores de gjwdb no dominio ww:
        for j = 1:1:length(ww)
            if w(i) == ww(j)
                filterjw = [filterjw gjwdb(i)];
            end
        end
    end
    erro = 0;
%     for k = 1:1:200 %calculando erro medio quadratico:
%         e = (filterjw(k) - gww(k))^2;
%         erro = erro + sqrt(e);
%     end
%     erro = erro/200;
%     if erro < 1000 %se eh uma boa aproxmaçao:
%         break
%     end
end

index_arr = find(gww <= pontos(1) - 3);
index = index_arr(end);
wc = ww(index);
K = 10^(pontos(1)/20);
tau = 1/wc;

        
        
        
        
        
        
        
        
        
        
        
