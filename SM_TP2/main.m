% Gabriel Martins Silva, Rui de Faria Machado

[x,t,num,den] = exame2(1223,2);
a = diff(t);


%% 1.
Ta = mean(a);
fa = 1/Ta;
% A variável 'a' é um vetor que armazena intervalos de tempo entre as
% diferentes amostras do sinal, ou seja, o período de amostragem


%% 2.
y = filter(num, den, x);
figure;
Espetro(y,Ta);
title('2) Espetro');
xlabel("Frequência (Hz)")
ylabel("Magnitude")


%% 3.
% Cálculo da resposta em frequência
[H,f]=respfreq(num,den,fa);

% Representação gráfica do módulo da resposta em frequência
figure;
plot(f, abs(H));
title('3) Resposta em Frequência');
xlabel('Frequência (Hz)');
ylabel('|H(f)|');

% Uma magnitude alta de |H(f)| indica que o filtro permite que 
% a frequência correspondente passe com pouca ou nenhuma atenuação,
% enquanto uma magnitude baixa indica que a
% frequência é fortemente diminuida.

%% 4.
% Parâmetros para atraso de 140ms
D = round(0.140 * fa); % Atraso do eco em amostras

z = zeros(1,length(x));

% Aplicar o eco
for n = 1:length(x)
    if n >= D + 1
        z(n) = x(n) - 0.8 * x(n-D);
    else
        z(n) = x(n);
    end
end

% Plotar o sinal original e o sinal com eco
figure;
subplot(4, 1, 1);
plot(t, x);
title('Sinal Original');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4, 1, 2);
plot(t, z);
title('Sinal com Atraso de 140ms');
xlabel('Tempo (s)');
ylabel('Amplitude');

subplot(4, 1, 3);
Espetro(z,Ta);
title('Espetro');
xlabel('Frequência (Hz)');
ylabel('Sinal');

den = 1;
num = [1 zeros(1, D-1),-0.8];
[H,f]=respfreq(num,den,fa);

subplot(4, 1, 4);
plot(f,abs(H));
title('Resposta em frequência');
xlabel('Frequência (Hz)');
ylabel('|H(f)|');