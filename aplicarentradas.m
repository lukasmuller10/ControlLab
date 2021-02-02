matrizgjw = [];
matrizfi = [];
for i=1:length(wk)
w = wk(i);
set_param('senoidetestar/Sine Wave','Frequency', string(w));
sim('senoidetestar.slx',10);
y = out.y;
u = out.u;
[gjw,fi] = alg3(u,y,w);
matrizgjw = [matrizgjw gjw];
matrizfi = [matrizfi fi];
end