clc
clear all
close all

format long e

x = 0:1:5;

H = [1 0.5 0.25];

f = @(x) cos(4*x) - 0.5*x;

XX = 0:0.01:5;

f_0 = @(x) -16*cos(4*x);

W3P = @(x, h) (1/(h^2))*(f(x+h)-2*f(x)+f(x-h));
W5P = @(x, h) (1/(12*(h^2)))*(-f(x-(2*h))+16*f(x-h)-30*f(x)+16*f(x+h)-f(x+(2*h)));

figure(1)

MSE = zeros(2);

for h=1:length(H)
    subplot(2,3,h)
    plot(XX, W3P(XX, H(h)))
    hold on
    plot(XX, f_0(XX))
    title({'W3P',H(h)})
    MSE(1, h) = (1/(length(x)))*sum((f_0(x)-W3P(x, H(h))).^2);
end

for h=1:length(H)
    subplot(2,3,h+3)
    plot(XX, W5P(XX, H(h)))
    hold on
    plot(XX, f_0(XX))
    title({'W5P',H(h)})
    MSE(2, h) = (1/(length(x)))*sum((f_0(x)-W5P(x, H(h))).^2);
end

sgtitle('Exercise 03')

MSE
