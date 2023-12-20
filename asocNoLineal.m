clear;
clc;

s = [-1 -1 1 1 1];

K = size(s, 2);

W = (1/K) * (s' * s);

W = W - diag(diag(W));

epochs = 21;

S = zeros(K, epochs);

S(:, 1) = [1 1 -1 -1 1];

for i = 2:epochs
    S(:, i) = S(:, i - 1);
    for k = 1:K
        h = sum(S(:, i)' .* W(k, :), "all");
        S(k, i) = (h > 0) * 2 - 1;
    end
    if (S(:, i) == S(:, i - 1))
        break;
    end
end

disp(S(:, i));
