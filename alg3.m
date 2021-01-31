% Nesse codigo foi considerado que a entrada u(t) e saida y(t) ja sao
% conhecidos (dados), onde a primeira coluna contem x, e a segunda
% contem f(x)



%[p,col]=size(u); %pegando a quantidade de linhas e coluna de u(t)
%k = [0:1:p]; %definindo k
function [modgjw,fik] = alg3(u,y,wk);
%como obter wk e o q fazer com ele?

ti = u(:,1);
uki = u(:,2);
yki = y(:,2);
%obtendo os coeficientes da serie de fourier para u(t) e y(t):
[coefu,fiu] = alg2(1,u,10); 
[coefy,fiy] = alg2(1,y,10);

modgjw = coefy/coefu
fik = fiy/fiu