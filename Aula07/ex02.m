load('Guitar03.mat');


teta=2*pi*(5000/fa);
xr=x+ 0.6*cos(teta*(0:length(x)-1)'+0.1*pi);

Espetro(xr,fa);
