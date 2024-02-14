function [simbolos,freq] = Alfabeto2(texto)
%ALFABETO2 Summary of this function goes here
%   Detailed explanation goes here
    simbolos = unique(texto);
    freq = zeros(1,length(simbolos));
    for i=1:length(simbolos)
        freq(i) = sum(simbolos(i)==texto);%/length(texto)*100;
    end
end