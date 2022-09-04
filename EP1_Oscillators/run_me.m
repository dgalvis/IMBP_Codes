%% Initialise
clear;clc;close all;
addpath('functions');
addpath('figures');

%% Example 1 (disconnected oscillators)
omega = [0.3; 0.6; 0.9];
K     = 0; % disconnected
y0    = [0; 0; 0];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, false, 'figure1.png'); %if true - save figure (slower)
movie1(t, y, false, 'movie1.mp4');% if true- save movie (this is slower)

%% Example 2 (disconnected oscillators, moving frame)

omega = [0.3; 0.6; 0.9] - 0.6;
K     = 0; % disconnected
y0    = [0; 0; 0];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, false, 'figure2.png'); %if true - save figure (slower)
movie1(t, y, false, 'movie2.mp4');% if true- save movie (this is slower)

%% Example 3 (connected oscillators, 2 oscillators)
omega = [0.6; 0.9];
K     = 0.4; % disconnected
y0    = [0; pi];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, true, 'figure3.png'); %if true - save figure (slower)
movie1(t, y, true, 'movie3.mp4');% if true- save movie (this is slower)

%% Example 4 (N homogeneous oscillators)
omega = 0.6;
K = 1;
y0 = 2*pi*rand(300, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, false, 'movie4.mp4');% if true- save movie (this is slower)

%% Example 5 (N homogeneous oscillators, moving frame)
omega = 0; % (given choice of omega, subtract that omega)
K = 1;
y0 = 2*pi*rand(300, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, false, 'movie5.mp4');% if true- save movie (this is slower)

%% Example 6 (N heterogeneous oscillators) Weak Coupling

% Note Cauchy distributions are very difficult to make nice movies with, so
% instead I've fabricated something by adding some long tails to a normal
% distribution.

% A - omega = omega + 0.6, K = 1
% B - omega = omega + 2, K = 1
% C - omega = 0.6*(omega + 2)/2, K = 0.5

rng(1000);
N = 1000;
omega = 0.1*randn(N, 1);
num_tails = 20;
omega(1:num_tails) = -1-rand(num_tails,1);
omega(end-num_tails+1:end)   = 1+rand(num_tails,1);
omega = 0.6*(omega + 2)/2;
%histogram1(omega, 100, true, 'histogram1c.png');



K = 0.5;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);

movie1(t, y, false, 'movie6c.mp4', omega);% if true- save movie (this is slower)

%% Example 7 (N heterogeneous oscillators, moving frame) Weak Coupling

% A - omega = omega + 0.6, K = 1
% B - omega = omega + 2, K = 1
% C - omega = 0.6*(omega + 2)/2, K = 0.5

rng(1000);
N = 1000;
omega = 0.1*randn(N, 1);
num_tails = 20;
omega(1:num_tails) = -1-rand(num_tails,1);
omega(end-num_tails+1:end)   = 1+rand(num_tails,1);
omega = 0.6*(omega + 2)/2;
omega = omega - mean(omega);
K = 0.5;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, true, 'movie7c.mp4', omega);% if true- save movie (this is slower)

%% Example 8 (N heterogeneous oscillators) Strong Coupling

% Note Cauchy distributions are very difficult to make nice movies with, so
% instead I've fabricated something by adding some long tails to a normal
% distribution.
rng(1000);
N = 1000;
omega = 0.1*randn(N, 1);
num_tails = 20;
omega(1:num_tails) = -1-rand(num_tails,1);
omega(end-num_tails+1:end)   = 1+rand(num_tails,1);
omega = omega + 0.6;

K = 10;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, true, 'movie8.mp4', omega);% if true- save movie (this is slower)

%% Example 9 (N heterogeneous oscillators, moving frame) Strong Coupling
rng(1000);
N = 1000;
omega = 0.1*randn(N, 1);
num_tails = 20;
omega(1:num_tails) = -1-rand(num_tails,1);
omega(end-num_tails+1:end)   = 1+rand(num_tails,1);
omega = omega + 0.6;
omega = omega - mean(omega);
K = 10;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, true, 'movie9.mp4', omega);% if true- save movie (this is slower)

%% Example 10 Lorenz Distribution Histogram
rng(10);
N = 1000;
m = 0.6;
b = 2;
omega = m + b * tan(pi*(rand(N,1)-1/2));

bins = -30:30;
x = -30:0.01:30;
histogram1(omega, bins, true, 'histogram2.png', [x;1./(pi*b*(1+((x-m)/b).^2))]);

%% Example 11 Lorenz Distribution
rng(10);
N = 1000;
m = 0.6;
b = 2;
omega = m + b * tan(pi*(rand(N,1)-1/2));
K = 6;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, true, 'movie10.mp4', omega);% if true- save movie (this is slower)

%% Example 12 Lorenz Distribution
rng(10);
N = 3000; % 1000 is reasonable for efficiency
m = 0.6;
b = 2;
omega = m + b * tan(pi*(rand(N,1)-1/2));
K = 6;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie2(t, y, true, 'movie11.mp4', omega);% if true- save movie (this is slower)

%% Example 13 Back to the made up distribution


rng(1000);
N = 3000;
omega = 0.1*randn(N, 1);
num_tails = 300;
omega(1:num_tails) = -0.2-rand(num_tails,1);
omega(end-num_tails+1:end)   = 0.2+rand(num_tails,1);
omega = omega + 2;

K = 0.5;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, false, 'movie12c.mp4', omega);% if true- save movie (this is slower)
movie2(t, y, true, 'movie12c.mp4', omega);% if true- save movie (this is slower)

