% a)
% O módulo de H(e^{jω}) varia entre (1-a) e (1+a)
% Este comportamento é esperado devido à natureza do filtro de eco, que
% adiciona uma cópia atrasada do sinal de entrada à entrada atual, resultando
% numa variação do módulo da resposta em frequência conforme mostrado.
% A variação do módulo é especialmente visível em frequências onde a fase
% do eco é inversamente proporcional à fase do sinal original.


% Carregar o sinal de áudio
[x, fs] = audioread('vozportugues.wav');

%% b)
% Parâmetros
a = 0.9;
distancia_eco = 17*2; % 17 metros ida e volta
velocidade_som = 340; % em m/s

% Cálculo de D
D = round((distancia_eco / velocidade_som) * fs);

% Coeficientes do filtro
num = [1 zeros(1, D-1) a];
den = 1;

% aplicar o filtro
yb = filter(num, den, x);

% Salvar o sinal de áudio processado
audiowrite('sinal_processado.wav', yb, fs);


%% c) teórica i guess


%% d)
% Parâmetros do filtro de reverberação
a = 0.9; % Coeficiente de atenuação do eco
D = 8; % Atraso do eco em amostras

% Coeficientes do filtro
num_reverb = [1 zeros(1, D-1) a]; % Numerador tem 1 seguido de D-1 zeros e 'a'
den_reverb = 1; % Denominador é 1 para um filtro FIR

% Calcula a resposta em frequência para o filtro de reverberação
[H_reverb, f_reverb] = freqz(num_reverb, den_reverb, 1024, 'whole');

% Plot da resposta em frequência do filtro de reverberação
figure;
plot(f_reverb, 20*log10(abs(H_reverb))); % Resposta em dB
title('Resposta em Frequência do Filtro de Reverberação');
xlabel('Frequência (rad/sample)');
ylabel('Magnitude (dB)');

% O gráfico da resposta em frequência nos mostra como o filtro afeta as diferentes
% frequências do sinal de entrada. Para um filtro de reverberação, esperamos ver
% uma resposta que mostre um certo ganho nas frequências correspondentes aos ecos.


%% e)
% Parâmetros para atraso de 10ms
a = 0.9;
D = round(0.01 * fs); % Atraso correspondente a 10ms

% Coeficientes do filtro
num = [1 zeros(1, D-1) a];
den = 1;

% Carregar o sinal de áudio e aplicar o filtro
ye = filter(num, den, x);

% Salvar o sinal de áudio processado com 10ms de atraso
audiowrite('sinal_processado_10ms.wav', ye, fs);


% executar audio (yb da alinea b, ye da alinea e)
player=audioplayer(yb,fs);
play(player)

