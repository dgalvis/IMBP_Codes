%% Animation
clear;clc;close all;
rng(1);
filename = 'animation_1.gif';
figure('Position', [100,500, 1000,1000]);hold all;

[X,Y] = meshgrid(-2*pi:pi/8:2*pi,-2*pi:pi/8:2*pi);
dXdt = sin(Y);
dYdt = cos(X+pi/2);

quiver(X,Y,dXdt,dYdt,'k', 'linewidth', 3);

% Simulate Many
y_all = cell(200,1);
tspan = 0:0.1:50;
for i = 1:length(y_all)
    yinit = 4*rand(1,2)*pi - 2*pi;    
    [t, y] = ode15s(@(t,y)([sin(y(2)); cos(y(1) + pi/2)]), tspan, yinit);
    y_all{i} = y;

end
xticks({});
yticks({});
box off;
set(gcf, 'Color', 'none');
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);
    end

    

    h = scatter(y(:,1), y(:,2), 200, parula(length(y)), 'filled');
    axis([-2*pi, 2*pi, -2*pi, 2*pi]);
    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end

%% Animation 
clear;clc;close all;
rng(4);
filename = 'animation_2.gif';
figure('Position', [100,500, 3000,300]);hold all;

[X,Y] = meshgrid(-20*pi:pi/3:20*pi,-2*pi:pi/3:2*pi);
dXdt = Y;
dYdt = -sin(X);

normed = sqrt(dXdt.^2 + dYdt.^2);
quiver(X,Y, dXdt./normed,dYdt./normed,'k', 'linewidth', 2);



% Simulate Many
y_all = cell(1000,1);
tspan = 0:0.1:50;
for i = 1:length(y_all)
    yinit = [60*rand*pi - 30*pi, 4*rand*pi - 2*pi];    
    [t, y] = ode15s(@(t,y)([y(2); -sin(y(1))]), tspan, yinit);
    y_all{i} = y;

end
xticks({});
yticks({});
box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);
    end
    h = scatter(y(:,1), y(:,2), 100, parula(length(y)), 'filled');
    axis([-20*pi, 20*pi, -2*pi, 2*pi]);

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end
%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_3.gif';

figure('Position', [100,500, 1000,1000]);hold all;
t = 0:0.001:3;
x = sin(2*pi*t) + t;
plot(t, x, 'w', 'linewidth', 5);
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});

for i = 1:50:length(t)

    h = scatter(t(i), x(i), 500, 'w', 'filled');
    axis tight;

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end

%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_4.gif';

figure('Position', [100,500, 250,1000]);hold all;

t = 0:0.001:3;
x = sin(2*pi*t) + t;
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});

for i = 1:50:length(t)

    h = scatter(1, x(i), 500, 'w', 'filled');
    axis([0.8, 1.2, min(x), max(x)]);

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end

%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_5.gif';

f = figure('Position', [100,500, 1000,2000]);hold all;
tiledlayout(2,1);
nexttile();hold all;
t = 0:0.01:3;
x = sin(2*pi*t) + t;
plot(t, x, 'w', 'linewidth', 5);
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});
axis([min(t), max(t), min(x)-1, max(x)+ 1]);

dx = 2*pi*cos(2*pi*t) + 1;
nexttile;hold all;
plot(t, dx, 'Color', color,  'linewidth', 5);
plot([t(1), t(end)], [0,0], 'w--', 'linewidth', 2)
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});
axis([min(t), max(t), min(dx)-1, max(dx)+ 1]);
box off;
set(gcf, 'Color', color);

for i = 1:1:length(t)

    if i>1
        if dx(i)*dx(i-1) < 0
            rep = 20;
        else
            rep = 1;
        end
    else
        rep =1;
    end

    for j = 1:rep
        nexttile(1);
        h1b = plot([t(i)-0.1, t(i) + 0.1], [x(i)-dx(i)*0.1, x(i) + dx(i)*0.1], 'y', 'linewidth', 5);
        h1 = scatter(t(i), x(i), 500, 'w', 'filled');
    
        axis([min(t), max(t), min(x)-1, max(x)+ 1]);
    
        nexttile(2);
        h2 = scatter(t(i), dx(i), 500, 'y', 'filled');
        h2b = plot(t(1:i), dx(1:i), 'y',  'linewidth', 5);
        drawnow
    
        frame = getframe(f);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);delete(h2);delete(h1b);delete(h2b);
    end



end

%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_6.gif';

figure('Position', [100,500, 250, 1000]);hold all;

t = 0:0.001:3;
x = sin(2*pi*t) + t;
dx = 2*pi*cos(2*pi*t) + 1;
color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
box off;
set(gcf, 'Color', color);
xticks({});
yticks({});

for i = 1:50:length(t)

        h1 = scatter(1, x(i), 500, 'w', 'filled');
        h2 = quiver(1, x(i), 0, dx(i)/abs(max(dx)), 0, 'y', 'linewidth', 5);
        axis([0.8, 1.2, min(x-1), max(x+1)]);
    
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);delete(h2);

end
%% Figure
clear;clc;close all;
figure('Position', [100,500, 1500, 250]);hold all;
filename = 'figure_1.png';


xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

num_pts = 10;

c = jet(num_pts);
plot([-num_pts, num_pts], [0,0], 'k', 'linewidth', 30);
plot([0,0],[-num_pts, num_pts],  'k', 'linewidth', 30);
for i = 1:length(c)
    quiver(i-1 + 0.1,0,0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
    quiver(-i+1 - 0.1,0,-0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
end
axis([-num_pts, num_pts, -0.15, 0.15]);

drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');


%% Animation
clear;clc;close all;
figure('Position', [100,500, 1500, 250]);hold all;
filename = 'animation_7.gif';


xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

num_pts = 10;

c = jet(num_pts);
plot([-num_pts, num_pts], [0,0], 'k', 'linewidth', 30);
plot([0,0],[-num_pts, num_pts],  'k', 'linewidth', 30);
for i = 1:length(c)
    quiver(i-1 + 0.1,0,0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
    quiver(-i+1 - 0.1,0,-0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
end
axis([-num_pts, num_pts, -0.15, 0.15]);

x0 = 0.5;
t  = 0:0.01:1.2;
x  = x0*exp(10*t);


for i = 1:1:length(t)

        h1 = scatter(x(i), 0, 500, 'w', 'filled');
    
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);
end


%% Animation
clear;clc;close all;
figure('Position', [100,500, 1500, 250]);hold all;
filename = 'animation_8.gif';


xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

num_pts = 10;

c = jet(num_pts);
plot([-num_pts, num_pts], [0,0], 'k', 'linewidth', 30);
plot([0,0],[-num_pts, num_pts],  'k', 'linewidth', 30);
for i = 1:length(c)
    quiver(i-1 + 0.1,0,0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
    quiver(-i+1 - 0.1,0,-0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
end
axis([-num_pts, num_pts, -0.15, 0.15]);

x0 = 0.5;
t  = 0:0.01:0.4;
x  = x0*exp(10*t);
x2  = -x0*exp(10*t);


for i = 1:1:length(t)

        h1 = scatter(x(i), 0, 500, 'w', 'filled');
        h2 = scatter(x2(i), 0, 500, 'w', 'filled');   
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);delete(h2);
end


%% Figure
clear;clc;close all;
figure('Position', [100,500, 500, 500]);hold all;
filename = 'figure_2.png';

xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

x0 = 0.5;
t  = 0:0.01:0.4;
x  = x0*exp(10*t);
x2  = -x0*exp(10*t);

plot(t, x, 'w', 'linewidth', 5);
plot(t, x2, 'w', 'linewidth', 5);
plot(t, 0*x2, 'w', 'linewidth', 5);

drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');

%% Animation
clear;clc;close all;
figure('Position', [100,500, 1500, 250]);hold all;
filename = 'animation_9.gif';


xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

num_pts = 10;

c = jet(num_pts);
plot([-num_pts, num_pts], [0,0], 'k', 'linewidth', 30);
plot([0,0],[-num_pts, num_pts],  'k', 'linewidth', 30);
for i = 1:length(c)
    quiver(i  - 0.1,0,-0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
    quiver(-i + 0.1,0,+0.8,0, 'off', 'color', c(i, :), 'linewidth', 5);
end
axis([-num_pts, num_pts, -0.15, 0.15]);

x0 = 10;
t  = 0:0.01:0.4;
x  = x0*exp(-10*t);
x2  = -x0*exp(-10*t);


for i = 1:1:length(t)

        h1 = scatter(x(i), 0, 500, 'w', 'filled');
        h2 = scatter(x2(i), 0, 500, 'w', 'filled');   
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);delete(h2);
end

%% Figure
clear;clc;close all;
figure('Position', [100,500, 500, 500]);hold all;
filename = 'figure_3.png';

xticks({});
yticks({});

box off;
set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);

x0 = 10;
t  = 0:0.01:0.4;
x  = x0*exp(-10*t);
x2  = -x0*exp(-10*t);

plot(t, x, 'w', 'linewidth', 5);
plot(t, x2, 'w', 'linewidth', 5);
plot(t, 0*x2, 'w', 'linewidth', 5);

drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');

%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_10.gif';

figure('Position', [100,500, 1000, 500]);hold all;

color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});

plot([0, 10], [0, 0], 'k', 'linewidth', 10);
plot([0, 0], [-1, 1], 'k', 'linewidth', 10);


K = 5;
r = 10;

x = 0:0.3:7;
y = r*x.*(1-x/K);
axis([-1, max(x), min(y), max(y)+5]);

plot([-1, max(x)], [0, 0], 'k', 'linewidth', 10);
plot([0, 0], [min(y), max(y)+5], 'k', 'linewidth', 10);


for i = 1:1:length(x)

        h1 = plot(x(1:i), y(1:i), 'w', 'linewidth', 5);
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);
end
%% Animation
clear;clc;close all;
rng(10);
filename = 'animation_11.gif';

figure('Position', [100,500, 1000, 500]);hold all;

color = [55, 55, 55]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});

plot([0, 10], [0, 0], 'k', 'linewidth', 10);
plot([0, 0], [-1, 1], 'k', 'linewidth', 10);


K = 5;
r = 10;

x = 0:0.3:10;
y = r*x.*(1-x/K);
axis([-1, max(x), min(y), max(y)+5]);

plot([-1, max(x)], [0, 0], 'k', 'linewidth', 10);
plot([0, 0], [min(y), max(y)+5], 'k', 'linewidth', 10);
plot(x, y, 'w', 'linewidth', 5);

t = 0:0.01:3;
x0 = 0.1;
x02 = 9.9;
xt = K*x0*exp(r*t)./(K + x0*(exp(r*t) - 1));
xt2 = K*x02*exp(r*t)./(K + x02*(exp(r*t) - 1));

for i = 1:1:length(t)

        h1 = scatter(xt(i), 0, 500, 'w', 'filled');
        h2 = scatter(xt2(i), 0, 500, 'w', 'filled');
        drawnow
    
        frame = getframe;
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if i == 1
            imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
        else
            imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
        end
    
        delete(h1);delete(h2);
end

%% Figure
clear;clc;close all;
rng(1);
filename = 'figure_4.png';
figure('Position', [100,500, 1000,1000]);hold all;

[X,Y] = meshgrid(0:0.6:10,0:0.3:5);
[X2,Y2] = meshgrid(0:0.6:11,0:0.3:6);
dXdt = 10*X - 5*X.*Y;
dYdt = X.*Y - 5*Y;

dXdt2 = 10*X2 - 5*X2.*Y2;
dYdt2 = X2.*Y2 - 5*Y2;

norm =3*sqrt(dXdt.^2 + dYdt.^2);
norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);


colormap jet;
pcolor(X2, Y2, norm2);
shading interp;
quiver(X,Y,dXdt./norm,dYdt./(2*norm), 0, 'k', 'linewidth', 3);
axis([0,10,0,5]);
caxis([0,300]);
xticks({});
yticks({});
box off;


drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');

%% Figure 
clear;clc;close all;
rng(1);
filename = 'figure_5.png';
figure('Position', [100,500, 1000,1000]);hold all;

[X,Y] = meshgrid(0:0.6:10,0:0.3:5);
[X2,Y2] = meshgrid(0:0.6:11,0:0.3:6);
dXdt = 10*X - 5*X.*Y;
dYdt = X.*Y - 5*Y;

dXdt2 = 10*X2 - 5*X2.*Y2;
dYdt2 = X2.*Y2 - 5*Y2;

norm =3*sqrt(dXdt.^2 + dYdt.^2);
norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);


colormap jet;
pcolor(X2, Y2, norm2);
shading interp;
%plot([5, 5], [0, 5], 'w:', 'linewidth', 10);
plot([0, 0], [0, 5], 'w--', 'linewidth', 10);
%plot([0, 20], [0, 0], 'w:', 'linewidth', 10);
plot([0, 20], [2, 2], 'w--', 'linewidth', 10);
quiver(X,Y,dXdt./norm,dYdt./(2*norm), 0, 'k', 'linewidth', 3);
axis([0,10,0,5]);
caxis([0,300]);
xticks({});
yticks({});
box off;


drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');

%% Figure
clear;clc;close all;
rng(1);
filename = 'figure_6.png';
figure('Position', [100,500, 1000,1000]);hold all;

[X,Y] = meshgrid(0:0.6:10,0:0.3:5);
[X2,Y2] = meshgrid(0:0.6:11,0:0.3:6);
dXdt = 10*X - 5*X.*Y;
dYdt = X.*Y - 5*Y;

dXdt2 = 10*X2 - 5*X2.*Y2;
dYdt2 = X2.*Y2 - 5*Y2;

norm =3*sqrt(dXdt.^2 + dYdt.^2);
norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);


colormap jet;
pcolor(X2, Y2, norm2);
shading interp;
plot([5, 5], [0, 5], 'w:', 'linewidth', 10);
plot([0, 0], [0, 5], 'w--', 'linewidth', 10);
plot([0, 20], [0, 0], 'w:', 'linewidth', 10);
plot([0, 20], [2, 2], 'w--', 'linewidth', 10);
quiver(X,Y,dXdt./norm,dYdt./(2*norm), 0, 'k', 'linewidth', 3);
axis([0,10,0,5]);
caxis([0,300]);
xticks({});
yticks({});
box off;


drawnow

frame = getframe;
im = frame2im(frame);
[imind,cm] = rgb2ind(im,256);
imwrite(imind,cm,filename,'png');
%% Animation 
clear;clc;close all;
rng(5);
filename = 'animation_12.gif';
figure('Position', [100,500, 1000,1000]);hold all;

[X,Y] = meshgrid(0:1:20,0:0.3:5);
[X2,Y2] = meshgrid(0:1:21,0:0.3:6);
dXdt = 10*X - 5*X.*Y;
dYdt = X.*Y - 5*Y;

dXdt2 = 10*X2 - 5*X2.*Y2;
dYdt2 = X2.*Y2 - 5*Y2;

norm =3*sqrt(dXdt.^2 + dYdt.^2);
norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);




colormap jet;
pcolor(X2, Y2, norm2);
shading interp;

plot([5, 5], [0, 5], 'w:', 'linewidth', 10);
plot([0, 0], [0, 5], 'w--', 'linewidth', 10);
plot([0, 20], [0, 0], 'w:', 'linewidth', 10);
plot([0, 20], [2, 2], 'w--', 'linewidth', 10);
scatter(5, 2, 1000,'w', 'filled')
quiver(X,Y,dXdt./norm,dYdt./(2*norm), 0, 'k', 'linewidth', 3);
axis([0,20,0,5]);
caxis([0,300]);
xticks({});
yticks({});
box off;



% Simulate Many
y_all = cell(10,1);
tspan = 0:0.01:1;
for i = 1:length(y_all)
    yinit = [5,2] + 1*randn(1,2);
    [t, y] = ode15s(@(t,y)([10*y(1) - 5*y(1)*y(2); y(1)*y(2) - 5*y(2)]), tspan, yinit);
    y_all{i} = y;

end



for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);
        plot(y_all{j}(1:i, 1), y_all{j}(1:i, 2),'w', 'linewidth', 3);
    end
    h = scatter(y(:,1), y(:,2), 200, 'white', 'filled');
    

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end


%% Animation (for twitter)
clear;clc;close all;
rng(5);
filename = 'animation_13.gif';
figure('Position', [100,500, 400,400]);hold all;

[X,Y] = meshgrid(0:1:20,0:0.3:5);
[X2,Y2] = meshgrid(0:1:21,0:0.3:6);
dXdt = 10*X - 5*X.*Y;
dYdt = X.*Y - 5*Y;

dXdt2 = 10*X2 - 5*X2.*Y2;
dYdt2 = X2.*Y2 - 5*Y2;

norm =3*sqrt(dXdt.^2 + dYdt.^2);
norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);




colormap jet;
pcolor(X2, Y2, norm2);
shading interp;

plot([5, 5], [0, 5], 'w:', 'linewidth', 2);
plot([0, 0], [0, 5], 'w--', 'linewidth', 2);
plot([0, 20], [0, 0], 'w:', 'linewidth', 2);
plot([0, 20], [2, 2], 'w--', 'linewidth', 2);
scatter(5, 2, 100,'w', 'filled')
quiver(X,Y,dXdt./norm,dYdt./(2*norm), 0, 'k', 'linewidth', 1);
axis([0,20,0,5]);
caxis([0,300]);
xticks({});
yticks({});
box off;



% Simulate Many
y_all = cell(10,1);
tspan = 0:0.01:1;
for i = 1:length(y_all)
    yinit = [5,2] + 1*randn(1,2);
    [t, y] = ode15s(@(t,y)([10*y(1) - 5*y(1)*y(2); y(1)*y(2) - 5*y(2)]), tspan, yinit);
    y_all{i} = y;

end



for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);
        plot(y_all{j}(1:i, 1), y_all{j}(1:i, 2),'w', 'linewidth', 1);
    end
    h = scatter(y(:,1), y(:,2), 40, 'white', 'filled');
    

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
end

%% Animation 
clear;clc;close all;
rng(5);
filename = 'animation_14.gif';
figure('Position', [100,500, 1500,500]);hold all;

xticks({});
yticks({});
box off;

set(gcf, 'Color', 'none');
color = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);


tspan = 0:0.01:2;
yinit = [5,2] + 1*randn(1,2);
[t, y] = ode15s(@(t,y)([10*y(1) - 5*y(1)*y(2); y(1)*y(2) - 5*y(2)]), tspan, yinit);

xlim([0, max(tspan)]);
ylim([0, max(y(:))]);

show = 1;
for i = 1:length(tspan)

    plot(tspan(1:i), y(1:i, 1),'w', 'linewidth', 3);
    plot(tspan(1:i), y(1:i, 2),'k', 'linewidth', 3);
    h = scatter(tspan(i), y(i,1), 200, 'white', 'filled');
    h2 = scatter(tspan(i), y(i,2), 200, 'k', 'filled');

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h); delete(h2);
end


%% Animation 
clear;clc;close all;
rng(5);
filename = 'animation_15.gif';
figure('Position', [100,500, 1000,1000]);hold all;

I = 1;

[X,Y] = meshgrid(-3:0.6:3,-1:0.4:3);
[X2,Y2] = meshgrid(-3.2:0.01:3.2,-1.2:0.01:3.2);
dXdt = X - X.^3/3 - Y + I;
dYdt = (X + 0.8 - 0.7*Y)/3;

dXdt2 = X2 - X2.^3/3 - Y2 + I;
dYdt2 = (X2 + 0.8 - 0.7*Y2)/3;

norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);

colormap jet;
pcolor(X2, Y2, norm2);
shading interp;


v1 =  -3.1:0.01:3.1;
w1 = v1 -v1.^3/3 + I;

w2 = (v1 + 0.8)/0.7;

plot(v1, w1, 'w--', 'linewidth', 5);
plot(v1, w2, 'w:', 'linewidth', 5);

quiver(X,Y,dXdt,dYdt, 'k', 'linewidth', 3);
axis([-3.1, 3.1, -1.1, 3.1]);
caxis([0,10]);
%xticks({});
%yticks({});
box off;


% Simulate Many
y_all = cell(10,1);
tspan = 0:0.2:20;
for i = 1:length(y_all)
    yinit = 1*randn(1,2);
    [t, y] = ode15s(@(t,y)([y(1) - y(1).^3/3 - y(2) + I; (y(1) + 0.8 - 0.7*y(2))/3]), tspan, yinit);
    y_all{i} = y;

end



for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);


        if i < 30
        iL = 1;
        else
            iL = i-29;
        end

        h2{j} = plot(y_all{j}(iL:i, 1), y_all{j}(iL:i, 2),'w', 'linewidth', 3);
    end
    h = scatter(y(:,1), y(:,2), 200, 'white', 'filled');
    

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end

    delete(h);
    
    for j = 1:length(y_all)
    delete(h2{j});
    end
end



%% Animation 
clear;clc;close all;
rng(11);
filename = 'animation_16.gif';
figure('Position', [100,500, 1500,500]);hold all;

I = 1;

color = [55, 55, 55]/ 256;
color2 = [195, 61, 5]/ 256;
set(gca, 'Color', color, 'XColor', color, 'YColor', color);
xticks({});
yticks({});
box off;


% Simulate Many
y_all = cell(5,1);
tspan = 0:0.3:60;
miny = zeros(length(y_all), 1);
maxy = miny;
color_all = zeros(length(y_all), 2);
for i = 1:length(y_all)
    yinit = 2*randn(1,2);
    [t, y] = ode15s(@(t,y)([y(1) - y(1).^3/3 - y(2) + I; (y(1) + 0.8 - 0.7*y(2))/3]), tspan, yinit);
    y_all{i} = y;
    miny(i) = min(y(:,1));
    maxy(i) = max(y(:,1));
end

xlim([min(tspan), max(tspan)]);
ylim([min(miny), max(maxy)]);

for i = 1:length(tspan)
    y = zeros(length(y_all), 2);
    for j = 1:length(y_all)
        y(j, :) = y_all{j}(i, :);
        

        if  abs(y_all{j}(i, 1) - min(y_all{j}(end-100:end, 1))) < 0.01 && color_all(j,1)==0 && tspan(i) > 20
            color_all(j,1) = i;
        elseif abs(y_all{j}(i, 1) - min(y_all{j}(end-100:end, 1))) < 0.01 && color_all(j,1)~=0  && color_all(j,2)==0 && tspan(i) > 5 + tspan(color_all(j,1))
            color_all(j,2) = i;
        end
    end


    for j = 1:length(y_all)        
        if color_all(j,1) ~=0 && color_all(j,2) == 0
            h1{j,1} = plot(tspan(color_all(j,1):i), y_all{j}(color_all(j,1):i), 'Color', color2, 'linewidth', 3);
        elseif color_all(j,1) ~=0 && color_all(j,2) ~= 0
            h1{j,2} = plot(tspan(color_all(j,1):color_all(j,2)), y_all{j}(color_all(j,1):color_all(j,2)), 'Color', color2, 'linewidth', 3);
        else
            start = max([min(nonzeros(color_all(:,1))),1]);
            h1{j, 1} = plot(tspan(start:i), y_all{j}(start:i, 1), 'w', 'linewidth', 3);
        end
    end
    h = scatter(tspan(i), y(:,1), 200, 'white', 'filled');
    

    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if i == 1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.05);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.05);
    end

    delete(h);
    for j = 1:size(h1, 1)
        for k = 1:size(h1, 2)
            delete(h1{j,k});
        end
    end
    
end

%% Animation 
clear;clc;close all;
filename = 'animation_17.gif';
figure('Position', [100,500, 1000,1000]);hold all;


I_all = linspace(-0.4, 2, 500);
for k = 1:length(I_all)
    rng(5);
    clf;hold all;
I = I_all(k);




[X,Y] = meshgrid(-3:0.6:3,-1:0.4:3);
[X2,Y2] = meshgrid(-3.2:0.01:3.2,-1.2:0.01:3.2);
dXdt = X - X.^3/3 - Y + I;
dYdt = (X + 0.8 - 0.7*Y)/3;

dXdt2 = X2 - X2.^3/3 - Y2 + I;
dYdt2 = (X2 + 0.8 - 0.7*Y2)/3;

norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);

colormap jet;
pcolor(X2, Y2, norm2);
shading interp;


v1 =  -3.1:0.01:3.1;
w1 = v1 -v1.^3/3 + I;

w2 = (v1 + 0.8)/0.7;

plot(v1, w1, 'w--', 'linewidth', 5);
plot(v1, w2, 'w:', 'linewidth', 5);

quiver(X,Y,dXdt,dYdt, 'k', 'linewidth', 3);
axis([-3.1, 3.1, -1.1, 3.1]);
caxis([0,10]);
%xticks({});
%yticks({});
box off;


% Simulate Many
y_all = cell(10,1);
tspan = 0:0.1:100;
for i = 1:length(y_all)
    yinit = 1*randn(1,2);
    [t, y] = ode15s(@(t,y)([y(1) - y(1).^3/3 - y(2) + I; (y(1) + 0.8 - 0.7*y(2))/3]), tspan, yinit);
    y_all{i} = y;

end


    for j = 1:length(y_all)
        h1{j} = scatter(y_all{j}(end, 1), y_all{j}(end, 2), 1000, 'w', 'filled');
        h2{j} = plot(y_all{j}(1:end, 1), y_all{j}(1:end, 2),'w', 'linewidth', 3);
    end
    
    txt = ['I = ', num2str(round(I, 3))];
    h3 = text(1.9, 2.5, txt, 'FontSize', 30, 'Color','white');
    drawnow

    frame = getframe;
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k==1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.02);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.02);
    end

    
    for j = 1:length(y_all)
        delete(h1{j});
    delete(h2{j});
    end
    delete(h3);
end

%% Animation 
clear;clc;close all;
filename = 'animation_18.gif';
figure('Position', [100,500, 1000,1500]);


I_all = linspace(-0.4, 2, 500);
for k = 1:length(I_all)


    rng(5);
    clf;
    tiledlayout(3,1);
    nexttile(2, [2,1]);hold all;


    I = I_all(k);




    [X,Y] = meshgrid(-3:0.6:3,-1:0.4:3);
    [X2,Y2] = meshgrid(-3.2:0.01:3.2,-1.2:0.01:3.2);
    dXdt = X - X.^3/3 - Y + I;
    dYdt = (X + 0.8 - 0.7*Y)/3;

    dXdt2 = X2 - X2.^3/3 - Y2 + I;
    dYdt2 = (X2 + 0.8 - 0.7*Y2)/3;

    norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);

    colormap jet;
    pcolor(X2, Y2, norm2);
    shading interp;


    v1 =  -3.1:0.01:3.1;
    w1 = v1 -v1.^3/3 + I;

    w2 = (v1 + 0.8)/0.7;

    plot(v1, w1, 'w--', 'linewidth', 5);
    plot(v1, w2, 'w:', 'linewidth', 5);

    quiver(X,Y,dXdt,dYdt, 'k', 'linewidth', 3);
    axis([-3.1, 3.1, -1.1, 3.1]);
    caxis([0,10]);
    %xticks({});
    %yticks({});
    box off;


    % Simulate Many
    y_all = cell(10,1);
    tspan = 0:0.1:100;
    for i = 1:length(y_all)
        yinit = 1*randn(1,2);
        [t, y] = ode15s(@(t,y)([y(1) - y(1).^3/3 - y(2) + I; (y(1) + 0.8 - 0.7*y(2))/3]), tspan, yinit);
        y_all{i} = y;

    end


    for j = 1:length(y_all)
        h1{j} = scatter(y_all{j}(end, 1), y_all{j}(end, 2), 1000, 'w', 'filled');
        h2{j} = plot(y_all{j}(1:end, 1), y_all{j}(1:end, 2),'w', 'linewidth', 3);
    end

    txt = ['I = ', num2str(round(I, 3))];
    h3 = text(1.9, 2.5, txt, 'FontSize', 30, 'Color','white');


    nexttile(1);hold all;



    color = [55, 55, 55]/ 256;
    %color2 = [195, 61, 5]/ 256;
    set(gca, 'Color', color, 'XColor', color, 'YColor', color);
    set(gcf, 'Color', color);
    xticks({});
    yticks({});
    axis([min(tspan), max(tspan), -3.1, 3.1]);
    box off;




    for i = 1:length(y_all)
        plot(tspan, y_all{i}(:, 1), 'w', 'linewidth', 3);
    end  



    drawnow

    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k==1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.02);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.02);
    end





    for j = 1:length(y_all)
        delete(h1{j});
        delete(h2{j});
    end
    delete(h3);
end


%% Animation (for twitter)
clear;clc;close all;
filename = 'animation_19.gif';
figure('Position', [100,500, 400,600]);


I_all = linspace(-0.4, 2, 65);
for k = 1:length(I_all)


    rng(5);
    clf;
    tiledlayout(3,1);
    nexttile(2, [2,1]);hold all;


    I = I_all(k);




    [X,Y] = meshgrid(-3:0.6:3,-1:0.4:3);
    [X2,Y2] = meshgrid(-3.2:0.01:3.2,-1.2:0.01:3.2);
    dXdt = X - X.^3/3 - Y + I;
    dYdt = (X + 0.8 - 0.7*Y)/3;

    dXdt2 = X2 - X2.^3/3 - Y2 + I;
    dYdt2 = (X2 + 0.8 - 0.7*Y2)/3;

    norm2 =3*sqrt(dXdt2.^2 + dYdt2.^2);

    colormap jet;
    pcolor(X2, Y2, norm2);
    shading interp;


    v1 =  -3.1:0.01:3.1;
    w1 = v1 -v1.^3/3 + I;

    w2 = (v1 + 0.8)/0.7;

    plot(v1, w1, 'w--', 'linewidth', 3);
    plot(v1, w2, 'w:', 'linewidth', 3);

    quiver(X,Y,dXdt,dYdt, 'k', 'linewidth', 1);
    axis([-3.1, 3.1, -1.1, 3.1]);
    caxis([0,10]);
    %xticks({});
    %yticks({});
    box off;


    % Simulate Many
    y_all = cell(10,1);
    tspan = 0:0.1:100;
    for i = 1:length(y_all)
        yinit = 1*randn(1,2);
        [t, y] = ode15s(@(t,y)([y(1) - y(1).^3/3 - y(2) + I; (y(1) + 0.8 - 0.7*y(2))/3]), tspan, yinit);
        y_all{i} = y;

    end


    for j = 1:length(y_all)
        h1{j} = scatter(y_all{j}(end, 1), y_all{j}(end, 2), 100, 'w', 'filled');
        h2{j} = plot(y_all{j}(1:end, 1), y_all{j}(1:end, 2),'w', 'linewidth', 3);
    end

    txt = ['I = ', num2str(round(I, 3))];
    h3 = text(1.9, 2.5, txt, 'FontSize', 20, 'Color','white');


    nexttile(1);hold all;



    color = [55, 55, 55]/ 256;
    %color2 = [195, 61, 5]/ 256;
    set(gca, 'Color', color, 'XColor', color, 'YColor', color);
    set(gcf, 'Color', color);
    xticks({});
    yticks({});
    axis([min(tspan), max(tspan), -3.1, 3.1]);
    box off;




    for i = 1:length(y_all)
        plot(tspan, y_all{i}(:, 1), 'w', 'linewidth', 3);
    end  



    drawnow

    frame = getframe(gcf);
    im = frame2im(frame);
    [imind,cm] = rgb2ind(im,256);
    if k==1
        imwrite(imind,cm,filename,'gif', 'Loopcount',inf, 'DelayTime', 0.1);
    else
        imwrite(imind,cm,filename,'gif','WriteMode','append', 'DelayTime', 0.1);
    end





    for j = 1:length(y_all)
        delete(h1{j});
        delete(h2{j});
    end
    delete(h3);
end