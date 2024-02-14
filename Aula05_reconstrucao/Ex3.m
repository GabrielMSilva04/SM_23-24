Ta = 0.01;

%% a)
f=1;
T=1/f;
Np = 100;
N=round(Np*T/Ta);
t=(0:N-1)*Ta;

x = sin(2*pi*t);

[X,f]=Espetro(x,Ta);

%% b)
f=1;
T=1/f;
Np=50;
N=round(Np*T/Ta);
t=(0:N-1)*Ta;

y = sin(10*pi*t) + cos(12*pi*t) + cos(14*pi*t-pi/4);

[X,f]=Espetro(y,Ta);

%% c)




