function [NumBits,NumBPS] = GeraMensagem(f,CompMesg,nBits)
    % f = vetor com a frequência de ocorrência de cada simbolo (em percentagem)
    % CompMesg = número total de símbolos
    % nBits = de dimensão 𝑁×1, cada elemento indica o número de bits com que é codificado o símbolo correspondente
    
    % Validação dos argumentos de entrada
    if length(f) ~= length(nBits)
        error('Os vetores f e nBits devem ter o mesmo comprimento.');
    end

    if sum(f) ~= 100
        error('f não é um vetor com probabilidades em percentagem');
    end
    
    % Gerar um vetor de números aleatórios uniformemente distribuídos
    randNums = rand(CompMesg, 1) * 100;
    
    % Calcular os limites para mapeamento baseado em probabilidades cumulativas
    cumProb = [0 cumsum(f)];
    
    % Inicializar a mensagem
    mensagem = zeros(CompMesg, 1);
    
    % Mapear os números aleatórios para os símbolos baseados nas probabilidades
    for i = 1:length(f)
        indices = randNums > cumProb(i) & randNums <= cumProb(i+1);
        mensagem(indices) = i;
    end
    
    % Calcular o número total de bits
    NumBits = sum(nBits(mensagem));
    
    % Calcular o número médio de bits por símbolo
    NumBPS = NumBits / CompMesg;
end