function [X,f] = Espetro(x,Ta)
    len = length(x);

    X = fftshift(fft(x));
    
    fa = 1/Ta;

    if rem(len,2) == 0
        f=(-len/2:len/2-1)*(fa/len);
    else
        f=(-(len-1)/2):(len-1/2)*(fa/len);
    end
    
    stem(f,abs(X)/len);
end
