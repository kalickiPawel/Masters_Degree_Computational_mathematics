clc
clear all
close all

format long e

x = 0:1:6;

H = [1 0.5 0.25];

f = @(x) cos(2*x);

XX = 0:0.01:6;
f_0 = @(x) -2*sin(2*x);
W2P = @(x, h) (f(x+h)-f(x))/h;
W3P = @(x, h) (f(x+h)-(f(x-h)))/(2*h);
W5P = @(x, h) (1/(12*h))*(f(x-2*h)-8*f(x-h)+8*f(x+h)-f(x+2*h));

figure(1)

MSE = zeros(3);

for h=1:length(H)
    subplot(3,3,h);
    plot(XX, W2P(XX, H(h)))
    hold on
    plot(XX, f_0(XX))
    title(H(h))
    MSE(1, h) = (1/(length(x)))*sum((f_0(x)-W2P(x, H(h))).^2);
end

for h=1:length(H)
    subplot(3,3,h+3)
    plot(XX, W3P(XX, H(h)))
    hold on
    plot(XX, f_0(XX))
    title(H(h))
    MSE(2, h) = (1/(length(x)))*sum((f_0(x)-W3P(x, H(h))).^2);
end

for h=1:length(H)
    subplot(3,3,h+6)
    plot(XX, W5P(XX, H(h)))
    hold on
    plot(XX, f_0(XX))
    title(H(h))
    MSE(3, h) = (1/(length(x)))*sum((f_0(x)-W5P(x, H(h))).^2);
end

sgtitle('Exercise 01')

MSE
