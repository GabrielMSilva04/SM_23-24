function [x,t] = fourierC(Ta,f0,Np,ck)
%FORIER Summary of this function goes here
%   Detailed explanation goes here

w0=f0*2*pi;
N=round(Np/(f0*Ta));
t=(0:N-1)*Ta;
x=0;
for k=1:length(ck)
    x=x+ck(k).*exp(1j*(k-floor(length(ck)/2)-1)*w0*t); 
end
end

