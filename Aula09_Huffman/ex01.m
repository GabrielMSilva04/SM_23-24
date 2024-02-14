%% a)
simbolos = 'ABCDE';
H = Entropia(simbolos);
fprintf('Entropia = %.4f', H);

%% b)
freq = [14 , 64 , 5 , 10 , 7];
probs = freq ./ sum(freq);
H = -sum(probs .* log2(probs)) - probs*log2(probs');


[dicionario,avglen] = huffmandict(1:5, probs);
input = randsrc(100,1,[1:5;probs]);
sequence = simbolos(input);
bitstream = huffmanenco(input, dicionario);

%% c)
totalBits = avglen * 1000

