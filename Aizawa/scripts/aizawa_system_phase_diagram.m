%% Aizawa System Phase Diagram Visualization
% This code aims to solve the Aizawa system
% written by Gabriel Heberle
% 
% The Aizawa equations are:
%
%  dx
% ---- = (z - b)*x - d*y
%  dt
% 
%  dy 
% ---- = d*x + (z - b)*y
%  dt
% 
%  dz               1
% ---- = c + a*z - ---*z^3 - (x^2 + y^2)*(1 + e*z) + f*z*x^3
%  dt               3
% 
% with parameters a = 0.95, b = 0.7, c = 0.6, d = 3.5, e = 0.25 and f = 0.1
% 


clear all
close all
clc

%% Loading simulation parameters
run('params.m')

%% Using MATLAB built-in solver
time = 0:dt:500;  % simulation time
F = @(t,x) [(x(3) - b)*x(1) - d*x(2)
            d*x(1) + (x(3) - b)*x(2)
            c + a*x(3) - (1/3)*x(3)^3 - (x(1)^2 + x(2)^2)*(1 + e*x(3)) + f*x(3)*x(1)^3];
[t,y] = ode45(F,time,x0);

%% Plotting time response and 3D phase diagram

figure('Name','Aizawa Attractor: States Time Response','NumberTitle','off')
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

figure('Name','Aizawa Attractor: 3D Phase Diagram','NumberTitle','off')
plot3(y(:,1),y(:,2),y(:,3))
grid on
title('3D Phase Diagram')
xlabel('x_{1}','FontWeight','bold')
ylabel('x_{2}','FontWeight','bold')
zlabel('x_{3}','FontWeight','bold')