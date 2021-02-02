% Nesse codigo foi considerado que a entrada u(t) e saida y(t) ja sao
% conhecidos (dados), onde a primeira coluna contem x, e a segunda
% contem f(x)

function [modgjw,fik] = alg3(u,y,w);
%como obter wk e o q fazer com ele?

ti = u(:,1);
uki = u(:,2);
yki = y(:,2);
%obtendo os coeficientes da serie de fourier para u(t) e y(t):
[coefu,fiu] = alg2(1,u,(2*pi)/w); 
[coefy,fiy] = alg2(1,y,(2*pi)/w);

modgjw = coefy/coefu;
fik = fiy/fiu;