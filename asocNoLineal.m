clear;
clc;

s = [-1 -1 1 1 1]; % Patron a memorizar

K = size(s, 2); % Numero de componentes del patron

W = (1/K) * (s' * s); % Calculo del vector de pesos

W = W - diag(diag(W)); % Eliminacion de autoasociaciones

epochs = 21; % Numero de iteraciones

S = zeros(K, epochs); % Historico de estados

S(:, 1) = [1 1 -1 -1 1]; % Patron de entrada

for i = 2:epochs
    S(:, i) = S(:, i - 1); % Se establece el estado actual al anterior
    for k = 1:K
        h = sum(S(:, i)' .* W(k, :), "all"); % Calculo del potencial
        S(k, i) = (h > 0) * 2 - 1; % Se establece el estado a -1 o 1, 
        % sinaptico en funcion de si el potencial es mayor o menor/igual 
        % que el umbral (0)
    end
    if (S(:, i) == S(:, i - 1)) % Si se ha estabilizado la red 
        % (es decir, el estado anterior es igual al actual), 
        % se para la ejecucion
        break;
    end
end

disp(S(:, i));


