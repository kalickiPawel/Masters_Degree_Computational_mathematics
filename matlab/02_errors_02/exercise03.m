clc
close all
clear all

format long e

X = [exp(1), -pi, sqrt(2), -psi(1), log10(2)];
Y = [1486.2497, 878366.9879, -22.37492, 4773714.647, 0.000185049];

n = length(X);

W1 = X * Y';

W2 = sum(X.*Y);

W3 = 0;
for i=1:n
    W3 = W3 + X(i)*Y(i);
end

W4 = 0;
for i=5:-1:1
    W4 = W4 + X(i)*Y(i);
end

W5 = 0;
for i=2:2:5
    W5 = W5 + + X(i)*Y(i);
end
for i=1:2:5
    W5 = W5 + + X(i)*Y(i);
end

ans = [abs(W1-W1) abs(W2-W1) abs(W3-W1) abs(W4-W1) abs(W5-W1)];
axes_x = categorical({'W1: scalar multiplication','W2: sum()','W3: positions from 1','W4: positions since last', 'W5: even/odd'});

bar(axes_x, ans)
title('Graph of error calculation of scalar product')
