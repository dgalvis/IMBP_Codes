%% Initialise
clear;clc;close all;
addpath('functions');
addpath('figures');
addpath('functions_figures');

%% Notes

% 1) for figure/movie functions, set make_figures -> true to save a png/mp4
make_figures = false;

%% Disconnected Oscillators

omega = [0.3; 0.6; 0.9];
K     = 0; 
y0    = [0; 0; 0];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, make_figures, 'disconnected_trajectories.png'); 
movie1(t, y, make_figures, 'disconnected_trajectories.mp4');

%% Disconnected oscillators, moving frame

omega = [0.3; 0.6; 0.9] - 0.6;
K     = 0;
y0    = [0; 0; 0];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, make_figures, 'disconnected_moving_frame.png'); 
movie1(t, y, make_figures, 'disconnected_moving_frame.mp4');

%% Coupling Value Illustration
coupling_figure([pi/4, pi/4],   make_figures, 'coupling_C0.png');
coupling_figure([pi/4, 3*pi/4], make_figures, 'coupling_C1.png');
coupling_figure([pi/4, 7*pi/4], make_figures, 'coupling_C2.png');
coupling_figure([pi/4, 5*pi/4], make_figures, 'coupling_C3.png');

%% Two heterogeneous oscillators
omega = [0.6; 0.9];
K     = 0.4;
y0    = [0; pi];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
figure1(t, y, make_figures, 'two_nodes.png'); %if true - save figure (slower)
movie1(t, y, make_figures, 'two_nodes.mp4');% if true- save movie (this is slower)

%% Two heterogeneous oscillators, phase difference frame
omega = [0.6; 0.9];
K     = 0.4; 
y0    = [0; pi];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
y = y - y(:,1);
figure1(t, y, make_figures, 'phase_difference.png'); 
movie1(t, y, make_figures, 'phase_difference.mp4');

%% Two heterogeneous oscillators, phase difference frame, two fixed points

Omega = 0.3;
K = 0.4;
y0 = 0:0.1:2*pi;
[t, y] = ode15s(@(t,y)vector_field_kuramoto_diff(t,y, Omega, K), 0:0.1:30, y0);
movie3(t, y, Omega/K, y0, make_figures, 'phase_difference_two_fixed_points.mp4');

%% Two heterogeneous oscillators, phase difference frame, one fixed point
Omega = 0.4;
K = 0.4;
y0 = 0:0.1:2*pi;
[t, y] = ode15s(@(t,y)vector_field_kuramoto_diff(t,y, Omega, K), 0:1:240, y0);
movie3(t, y, Omega/K, y0, make_figures, 'phase_difference_one_fixed_point.mp4');


%% Two heterogeneous oscillators, phase difference frame, no fixed points
Omega = 0.45; 
K = 0.4;
y0 = 0:0.1:2*pi;
[t, y] = ode15s(@(t,y)vector_field_kuramoto_diff(t,y, Omega, K), 0:1:240, y0);
movie3(t, y, Omega/K, y0, make_figures, 'phase_difference_no_fixed_points.mp4');

%% Two heterogeneous, ghosts
omega = [2.4; 4.4];
K     = 1.6;
y0    = [0; pi];
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:30, y0);
movie4(t, y, (omega(2)-omega(1))/K, make_figures, 'ghosts.mp4');


%% N homogeneous oscillators
N = 300;
omega = 0.6*ones(N,1);
K = 1;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, make_figures, 'homogeneous_trajectories.mp4', omega);

%% N homogeneous oscillators, moving frame
N = 300;
omega = zeros(N,1); 
K = 1;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, make_figures, 'homogeneous_moving_frame.mp4', omega);% if true- save movie (this is slower)

%% Show phase shifts of all nodes don't matter (for the interactions)
rng(10);
phase_shift_figure(0, make_figures, 'phase_shifts_0.png');
rng(10);
phase_shift_figure(pi/4, make_figures, 'phase_shifts_1.png');

%% N homogeneous oscillators, Mean phase zero frame
rng(11);
N = 20;
omega = zeros(N,1);
K = 1;
y0 = 2*pi*rand(N, 1);
y0 = y0 -  angle(mean(exp(1j*y0),1)); % not necessary
Tmax = 2*pi*10;
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0, options);
y = y -  angle(mean(exp(1j*y),2));
movie1(t, y, make_figures, 'homogeneous_phase_zero', omega);


% Important note: This method actually doesn't work for simulation (without
% some finesse). The problem is that the mean phase drifts even in the
% moving frame and this model -rKsin(theta) assumes that the mean phase
% stays the same (0). This version of the model can only be used for finding
% fixed points (and analysing stability) I think (but if anyone reads this
% and can elaborate, that would be very useful.

% So in the function vector_field_kuramoto_mean_field.m, I've added  y = y - angle(mean(exp(1j*y)));
% so that the vector field gets a mean phase of zero at each time step.

% Both functions now produce the same output, but you can note that y (above)
% and y2 (below) both have drifting phase. So you need y2 = y2 -  angle(mean(exp(1j*y2),2));
% to show the system in the frame where mean phase is always 0. 

% dxdt(i) = -rKsin(x(i)) version
rng(11);
N = 20;
K = 1;
y0 = 2*pi*rand(N, 1);
y0 = y0 -  angle(mean(exp(1j*y0),1)); % not necessary
Tmax = 2*pi*10;
[t, y2] = ode15s(@(t,y)vector_field_kuramoto_mean_field(t,y, K), 0:0.03:Tmax, y0, options);
y2 = y2 -  angle(mean(exp(1j*y2),2));
%movie1(t, y2, make_figures, 'homogeneous_phase_zero_v2', omega);



%% N homogeneous oscillators, fixed points
num_nodes = 6;
theta = 2*pi*((1:num_nodes)-1)/num_nodes;
solution_figure(theta, make_figures, 'solutions_incoherent.png');

theta = [0,0, pi, 0, 0, 0];
solution_figure(theta, make_figures, 'solutions_saddle.png');

theta = [-pi/12,pi/12, pi, 0, 0, 0];
solution_figure(theta, make_figures, 'solutions_saddle_stable_manifold.png');

theta = [0,0,0, 0, 0, 0];
solution_figure(theta, make_figures, 'solutions_coherent.png');

%% Two homogeneous node gradient
two_node_gradient(make_figures, 'two_node_gradient')
coupling_figure([-pi/2, pi/2], make_figures, 'coupling_G0.png');
coupling_figure([pi, pi], make_figures, 'coupling_G1.png');
coupling_figure([-pi/4, 3*pi/4], make_figures, 'coupling_G2.png');
coupling_figure([-3*pi/4, -3*pi/4], make_figures, 'coupling_G3.png');

%% Two homogeneous node gradient, trajectory
omega = [0;0];
K     = 0.4;
epsilon = 1e-3;
y0    = [-pi/2-epsilon; pi/2+epsilon];
Tmax = 2*pi*10;
[t, y] = ode15s(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie1(t, y, make_figures, 'two_node_gradient_trajectory.mp4');

%% Three homogeneous node gradient slice
three_node_gradient(make_figures, 'three_node_gradient');
coupling_figure([0,0,0], make_figures, 'coupling_Gb0.png');
coupling_figure([0, 2*pi/3, -2*pi/3], make_figures, 'coupling_Gb1.png');
coupling_figure([0, pi, -pi], make_figures, 'coupling_Gb2.png');
coupling_figure([pi/3, pi/3, -2*pi/3], make_figures, 'coupling_Gb3.png');

%% N heterogeneous oscillators, Lorenz distribution
rng(10);
N = 3000; 
m = 0.6;
b = 2;
omega = m + b * tan(pi*(rand(N,1)-1/2));
K = 6;
y0 = 2*pi*rand(N, 1);
Tmax = 2*pi*10;
[t, y] = ode45(@(t,y)vector_field_kuramoto(t,y, omega, K), 0:0.03:Tmax, y0);
movie2(t, y, make_figures, 'heterogeneous_trajectories', omega);
