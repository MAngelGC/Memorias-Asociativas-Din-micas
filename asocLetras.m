clear;
clc;
letras;

K = size(d, 3);
nfilas = size(d, 1);
ncol = size(d, 2);

W = zeros(nfilas * ncol, nfilas * ncol);
dVect = zeros(K, nfilas * ncol);

for k = 1:K
    dVect(k, :) = reshape(d(:, :, k), 1, nfilas * ncol);
    W = W + dVect(k, :)' * dVect(k, :);
end

W = (1/K) * W;
W = W - diag(diag(W));

epochs = 21;

for k = 1:K
    S = zeros(size(W, 1), epochs);
    S(:, 1) = dVect(k, :);
    disp("Modelo partida");
    reshape(S(:, 1), 9, 7)
    for i = 2:epochs
        S(:, i) = S(:, i - 1);
        for t = 1:K
            h = sum(S(:, i)' .* W(t, :), "all");
            S(t, i) = (h > 0) * 2 - 1;
        end
        if (S(:, i) == S(:, i - 1))
            break;
        end
    end
    disp("Modelo final");
    reshape(S(:, i), 9, 7)
end