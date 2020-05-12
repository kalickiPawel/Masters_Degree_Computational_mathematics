x= [ 0 0.5 1 1.5 2 2.5 3];
y= [0.04 0.075 0.11 0.145 0.180 0.215 0.250];
z= [0 0.77 0.73 0 -0.1 -0.3 -0.5
    0 0.68 0.85 0.72 0.38 -0.1 -0.3
    0 0.54 0.82 0.83 0.69 0.45 0.18
    0 0.4 0.76 0.85 0.8 0.68 0.5
    0 0.34 0.65 0.83 0.84 0.78 0.65
    0 0.29 0.55 0.8 0.85 0.82 0.76
    0 0.26 0.48 0.72 0.84 0.85 0.8];

step_x = 0.01;
step_y = 0.01;

[X,Y]=meshgrid(x,y);

xp=reshape(X,1,[]);
yp=reshape(Y,1,[]);
zp=reshape(z,1,[]);

d=length(xp);

FigH = figure();
set(FigH, 'NumberTitle', 'off', ...
    'Name', sprintf('Date: %s', datestr(now, 0)));

% --model 1-- %
subplot(2,2,1)

Z=[xp;yp;ones(1,d)];
C=zp*Z'*inv(Z*Z');

F = @(a, b) (C(1)*a + C(2)*b + C(3));

plot3(X,Y,z,'.b')
hold on

xx=x(1):step_x:x(end);
yy=y(1):step_y:y(end);

[XX,YY]=meshgrid(xx,yy);

W = F(XX,YY);
mesh(XX,YY,W)
title('model 1')

% --model 2-- %
subplot(2,2,2)

Z=[xp.^2;yp.^2;ones(1,d)];
C=zp*Z'*inv(Z*Z');

F2 = @(a, b) (C(1)*a.^2 + C(2)*b.^2 + C(3));

plot3(X,Y,z,'.b')
hold on

xx=x(1):step_x:x(end);
yy=y(1):step_y:y(end);

[XX,YY]=meshgrid(xx,yy);

W = F2(XX,YY);
mesh(XX,YY,W)
title('model 2')

% --model 3-- %
subplot(2,2,3)

Z=[xp.^2;yp.^2;xp.*yp;ones(1,d)];
C=zp*Z'*inv(Z*Z');

F3 = @(a, b) (C(1)*a.^2 + C(2)*b.^2 + C(3)*a.*b + C(4));

plot3(X,Y,z,'.b')
hold on

xx=x(1):step_x:x(end);
yy=y(1):step_y:y(end);

[XX,YY]=meshgrid(xx,yy);

W = F3(XX,YY);
mesh(XX,YY,W)
title('model 3')

% --model 4-- %
subplot(2,2,4)

Z=[xp.^3;xp.^2;xp;yp.^3;yp.^2;yp;ones(1,d)];
C=zp*Z'*inv(Z*Z');

F4 = @(a, b) (C(1)*a.^3 + C(2)*a.^2 +C(3)*a + C(4)*b.^3 +C(5)*b.^2 + C(6)*b + C(7));

plot3(X,Y,z,'.b')
hold on

xx=x(1):step_x:x(end);
yy=y(1):step_y:y(end);

[XX,YY]=meshgrid(xx,yy);

W = F4(XX,YY);
mesh(XX,YY,W)
title('model 4')

sgtitle('Approximation of input data using 4 mathematical models')
