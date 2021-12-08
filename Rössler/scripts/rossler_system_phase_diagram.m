%% Chaotic Circuits - Rössler's Attractor Equations
% Solution written by Gabriel Heberle - August, 2020
% 
% The equations which define the system are:
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

clear all
close all
clc

% Loading simulation parameters
run('params.m')

%% Using MATLAB built-in solver
time = 0:dt:500;  % simulation time
F = @(t,x) [-x(2)-x(3);x(1)+a*x(2);b+x(3)*(x(1)-c)];
[t,y] = ode45(F,time,x0);

%% Plotting time response and 3D phase diagram
figure('Name','Rössler Attractor: States Time Response','NumberTitle','off')
hold on

subplot(3,1,1)
plot(t,y(:,1),'b')
grid on
xlabel('time_{seconds}','FontWeight','bold')
ylabel('Amplitude','FontWeight','bold')
title('Time response for state x_{1}')

subplot(3,1,2)
plot(t,y(:,2),'r')
grid on
xlabel('time_{seconds}','FontWeight','bold')
ylabel('Amplitude','FontWeight','bold')
title('Time response for state x_{2}')

subplot(3,1,3)
plot(t,y(:,3),'m')
grid on
xlabel('time_{seconds}','FontWeight','bold')
ylabel('Amplitude','FontWeight','bold')
title('Time response for state x_{3}')

figure('Name','Rössler Attractor: 3D Phase Diagram','NumberTitle','off')
plot3(y(:,1),y(:,2),y(:,3))
grid on
title('3D Phase Diagram')
xlabel('x_{1}','FontWeight','bold')
ylabel('x_{2}','FontWeight','bold')
zlabel('x_{3}','FontWeight','bold')
