function [x,t] = Reconstroi(X,f)
%RECONSTROI Summary of this function goes here
%   Detailed explanation goes here
    N = length(X);
    Fa = max(f)*2; % Calcula a frequência de amostragem
    x = ifft(ifftshift(X))*N; % Aplica a transformada inversa de Fourier
    Ta = 1/Fa; % Calcula o período de amostragem
    t = (0:N-1)*Ta;
end

