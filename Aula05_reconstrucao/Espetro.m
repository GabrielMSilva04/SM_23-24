function [X,f] = Espetro(x,Ta)
    N=length(x);
    X=fftshift(fft(x))/N;

    fa=1/Ta;
    df=fa/N;
    f=(0:(N-1))*df-fa/2;
    
    plot(f, abs(X));
    xlabel("Frequência (Hz)")
    ylabel("Magnitude")
    grid;
end