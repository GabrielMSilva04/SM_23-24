CompMsg = 1000; % Número total de símbolos na mensagem
f = [14 64 5 10 7]; % Frequências dos símbolos A, B, C, D, E
nBits = [2, 1, 3, 3, 3]; % Número de bits para cada símbolo, supondo um exemplo de códigos de Huffman

[NumBits, NumBPS] = GeraMensagem(f, CompMsg, nBits);
