%% a)
Ta = 0.01;
T0 = 1;
f0 = 1/T0;
Np = 2;
t=2;
x = 0:Ta:t-Ta;


K=5;
kn = -K : K;
[ck]=coeficiente(Ta,T0,x,K);
disp("Ck")
disp(ck)

figure(1)
stem(kn,abs(ck))
xlabel('Frequência(Hz)');
ylabel('|Ck|');


ckt = [0 (1-exp(-1j*pi*1))./ (1j*pi.*1) (1-exp(-1j*pi*2))./ (1j*pi.*2) (1-exp(-1j*pi*3))./ (1j*pi.*3) (1-exp(-1j*pi*4))./ (1j*pi.*4) (1-exp(-1j*pi*5))./ (1j*pi.*5)];
%c(k=0) é um número indefinido mas nós definimos como zero para faciliar
%cálculos computacionais

if(ckt==ck(K+1:2*K+1))
    disp("os coeficiente calculados computacionalmente e analiticamente são iguais")
else
    disp("os coeficiente calculados computacionalmente e analiticamente não são iguais")
end