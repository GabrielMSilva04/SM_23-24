function H = Entropia(Texto)
    % Calcula a frequência de cada símbolo no texto
    simbolos = unique(Texto);
    n = length(Texto);
    frequencias = zeros(size(simbolos));
    
    for i = 1:length(simbolos)
        frequencias(i) = sum(Texto == simbolos(i));
    end
    
    % Calcula a probabilidade de cada símbolo
    prob = frequencias / n;
    
    % Calcula a entropia (em bits por símbolo)
    H = -sum(prob .* log2(prob));
    
    % Trata o caso de log2(0) que é NaN
    H(isnan(H)) = 0;
end
