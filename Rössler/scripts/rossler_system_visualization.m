%% Rössler System Attractor Visualization
% This code aims to solve and plot the 3D map of Rössler system
% written by Gabriel Heberle
% 
% The Rössler equations are:
%
%  dx
% ---- = -(y + z)
%  dt
% 
%  dy
% ----  = x + a*y
%  dt
% 
%  dz
% ----  = b + z*(x - c)
%  dt
% 
% Parameters: a = 0.2, b = 0.2 and c = 5.7
% Obs.: generally, b is left as a variable value.
% 

clear all
close all
clc

% Loading simulation parameters
run('params.m')
%% Solving
% Initial conditions
x1 = .100;
x2 = .101;
x3 = .102;
y1 = 1.000;
y2 = 1.001;
y3 = 1.002;
z1 = .203;
z2 = .204;
z3 = .205;

% Allocating space for the reponses
N = 1000000;
x_array = zeros(N,3);
y_array = zeros(N,3);
z_array = zeros(N,3);

for j = 1:N
    % (j, 1)
    % Calculating the next coordinates based on the system's equations
    x1d = ((z1 - b)*x1 - d*y1)*dt;
    y1d = (d*x1 + (z1 - b)*y1)*dt;
    z1d = (c + a*z1 - (1/3)*z1^3 - (x1^2 + y1^2)*(1 + e*z1) + f*z1*x1^3)*dt;
    
    % Updating old coordinates
    x1 = x1 + x1d;
    y1 = y1 + y1d;
    z1 = z1 + z1d;
    
    % Saving the newly calculated coordinates
    x_array(j,1) = x1;
    y_array(j,1) = y1;
    z_array(j,1) = z1;
    
    % (j, 2)
    % Calculating the next coordinates based on the system's equations
    x2d = ((z2 - b)*x2 - d*y2)*dt;
    y2d = (d*x2 + (z2 - b)*y2)*dt;
    z2d = (c + a*z2 - (1/3)*z2^3 - (x2^2 + y2^2)*(1 + e*z2) + f*z2*x2^3)*dt;
    
    % Updating old coordinates
    x2 = x2 + x2d;
    y2 = y2 + y2d;
    z2 = z2 + z2d;
    
    % Saving the newly calculated coordinates
    x_array(j,2) = x2;
    y_array(j,2) = y2;
    z_array(j,2) = z2;
    
    % (j, 3)
    % Calculating the next coordinates based on the system's equations
    x3d = ((z3 - b)*x3 - d*y3)*dt;
    y3d = (d*x3 + (z3 - b)*y3)*dt;
    z3d = (c + a*z3 - (1/3)*z3^3 - (x3^2 + y3^2)*(1 + e*z3) + f*z3*x3^3)*dt;
    
    % Updating old coordinates
    x3 = x3 + x3d;
    y3 = y3 + y3d;
    z3 = z3 + z3d;
    
    % Saving the newly calculated coordinates
    x_array(j,3) = x3;
    y_array(j,3) = y3;
    z_array(j,3) = z3;
end

% figh = figure;
grid on
h1 = animatedline('MaximumNumPoints', 10000, 'Color', 'r', 'LineWidth', 0.2);
h2 = animatedline('MaximumNumPoints', 10000, 'Color', 'g', 'LineWidth', 0.2);
h3 = animatedline('MaximumNumPoints', 10000, 'Color', 'b', 'LineWidth', 0.2);

axis([-2,2,-2,2,-1,2])
view(3)

a = tic; % start timer
for k = 1:N
    addpoints(h1, x_array(k,1), y_array(k,1), z_array(k,1))
    addpoints(h2, x_array(k,2), y_array(k,2), z_array(k,2))
    addpoints(h3, x_array(k,3), y_array(k,3), z_array(k,3))
    
    b = toc(a); % check timer
    if b > (1/100)
        drawnow % update screen every 1/30 seconds
        a = tic; % reset timer after updating
    end
end
