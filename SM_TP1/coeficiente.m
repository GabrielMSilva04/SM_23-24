function [ck] = coeficiente(Ta,T0,x,K)
%COEFICIENTE Summary of this function goes here
%   Detailed explanation goes here
kn= -K:K;
ck=zeros(1,length(kn));
ck(1:2*K+1) = (1-exp(-1j*pi*kn))./ (1j*pi.*kn);
ck(K+1) = 0;
end