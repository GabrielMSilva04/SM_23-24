load('Mensagem.mat')

%% 1.
Simbolos = Alfabeto1(Mensagem);

%% 2.
[Simbolos,freq] = Alfabeto2(Mensagem);

%% 3.
NumBits1 = round(length(Simbolos)/2) * length(Mensagem)
% 'ABC'
% A = 00
% B = 01
% C = 10

%% 4.
NumBits2 = NumeroBitsCodigo2(Mensagem)

%% 5.

%% 6.
H = Entropia(Mensagem)
