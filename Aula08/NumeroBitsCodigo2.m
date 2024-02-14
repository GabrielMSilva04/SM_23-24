function NumBits = NumeroBitsCodigo2(Texto)
    [Simbolos, freq] = Alfabeto2(Texto); % Assume que esta função retorna símbolos e suas frequências correspondentes
    [freq, idx] = sort(freq, 'descend');
    Simbolos_ordenados = Simbolos(idx);

    % Calcular o número de bits necessário para cada símbolo
    NumBits = 0;
    for k = 1:length(Simbolos)
        NumBits = NumBits + freq(k) * k;
    end
end