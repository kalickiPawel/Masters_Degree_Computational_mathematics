clc
close all
clear all

format long e

tab=[10^6 0.2 0.2 0.2 -10^6];

tab=double(tab);
n=length(tab);

A1=0;
A2=0;
A3=0;
A4=0;

% --Adding the sum of subsequent items in a loop--%
tic
for i=1:n
    A1=A1+tab(i);
end
t1 = toc;

% --sum() function--%
tic
A2=sum(tab);
t2 = toc;

% --Kahan summation algorithm-- %
tic
S=tab(1);
C=0;

for i=2:n
    Y=tab(i)-C;
    T=S+Y;
    C=(T-S)-Y;
    S=T;
end
A3=S;
t3 = toc;

% --Gill-Moller algorithm-- %
tic
S=0;
U=0;
P=0;
for i=1:n
    S=U+tab(i);
    P=U-S+tab(i)+P;
    U=S;
end
S=S+P;
A4=S;
t4 = toc;

% --sum of elements of the string-- %
% S_n = (tab(1)+tab(n))/2*n;
S_n = 0.6;
S_n = double(S_n);

ans = [abs(A1-S_n) abs(A2-S_n) abs(A3-S_n) abs(A4-S_n)];
axes_x = categorical({'A1: loop','A2: sum()','A3:Kahan','A4: Gill-Moller'});

bar(axes_x, ans)
title('Graph of calculation of string sums (double prec)')
