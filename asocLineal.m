clear;
clc;

X = rand(4, 5);
Y = rand(4, 2);
A = rand(4, 5);
B = rand(4, 2);

X = orth(X')';
Y = orth(Y);

W1 = X'*Y;
W2 = A'*B;

disp(Y);
disp(X * W1);

disp(B);
disp(A * W2);