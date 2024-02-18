[S,Fa]=exame(1999,1);
%% a)
% 1) 
T = 0.2;
% 2) 
tf = 1;
% 3) 3 sinusoides, 
f0 = 20;
f1 = 25;
f2 = 30;

%% b)
Ta = 1/Fa;
N = tf/Ta;

x=0:Ta:tf-Ta;

fa=1/Ta;
df=fa/N;
f=(0:(N-1))*df-fa/2;

%% c)
figure(2)
plot(x,S)
xlabel("tempo(s)")
ylabel("Amplitude")


%% d)
%S(N/2+1)=N;


%% e)
[X,f] = Espetro(x,Ta);

figure(3)
f(N/2+f0+1)=0;
f(N/2-f0+1)=0;
stem(f,abs(X)/length(x));
title("Espetro")
xlabel("m")
ylabel("|Xm|")

figure(4)
[x,t] = Reconstroi(X,f);
plot(t,x)
title("Sinal reconstruido")
xlabel("t")
ylabel("amp")

%o período do sinal foi alterado

%% f)
minF=21;
maxF=29;
FLimitado=(abs(f)>=minF)&(abs(f)<=maxF);
XL=X.*FLimitado';
%XL=X.*FLimitado';

[XR,t] = Reconstroi(XL,f);
% sound(abs(XR),fa);
plot(t,x,t,real(XR),"r");
drawnow
pause(5)

