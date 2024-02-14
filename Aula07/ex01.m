%[x,fa] = audioread('vozportugues.wav');
load('Guitar03.mat');

Espetro(x,fa);
%soundsc(x,fa)