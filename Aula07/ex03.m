load('Guitar03.mat');
%% a)
R=0.9;
teta=2*pi*(5000/fa);

% Coeficientes do numerador e denominador da função de transferência H(z)
num=[1 -2*cos(teta) 1];
den=[1 -2*R*cos(teta) R^2];

% Cálculo da resposta em frequência
[H,f]=respfreq(num,den,fa);

% Representação gráfica do módulo da resposta em frequência
figure;
plot(f, abs(H));
title('Resposta em Frequência');
xlabel('Frequência (Hz)');
ylabel('|H(f)|');


%% b)
% Sinal de entrada x, assumindo que x já está definido

% Aplicação do filtro
y = filter(num, den, x);

% Representação gráfica do conteúdo de frequência de x, H e y utilizando subplot
figure;
subplot(3,1,1);
plot(abs(fft(x)));
title('Conteúdo de Frequência de x');

subplot(3,1,2);
plot(f, abs(H));
title('Módulo da Resposta em Frequência H');

subplot(3,1,3);
plot(abs(fft(y)));
title('Conteúdo de Frequência de y');


%% c)
% Geração do sinal de entrada sinusoidal
f_sin = 1000; % Frequência da sinusóide
t = 0:1/fa:1; % Vector de tempo de 1 segundo
x_sin = sin(2*pi*f_sin*t); % Sinal sinusoidal de entrada

% Aplicação do filtro ao sinal sinusoidal
y_sin = filter(num, den, x_sin);

% Análise do sinal de saída
figure;
subplot(2,1,1);
plot(t, x_sin);
title('Sinal Sinusoidal de Entrada');

subplot(2,1,2);
plot(t, y_sin);
title('Sinal de Saída do Filtro');

