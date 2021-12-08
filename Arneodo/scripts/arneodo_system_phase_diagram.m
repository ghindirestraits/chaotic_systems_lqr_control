%% Arneodo System Phase Diagram Visualization
% This code aims to solve the Arneodo system
% written by Gabriel Heberle
% 
% The Arneodo equations are:
%
%  dx
% ---- = y
%  dt
% 
%  dy 
% ---- = z
%  dt
% 
%  dz
% ---- = alpha*x + beta*y - z - x^3
%  dt
% 
% with parameters alpha = 5.5 and beta = -3.5.
% 

clear all
close all
clc

%% Loading simulation parameters
run('params.m')

%% Using MATLAB built-in solver
time = 0:dt:500;  % simulation time
F = @(t,x) [x(2)
            x(3)
            alpha*x(1) + beta*x(2) - x(3) - x(1)^3];
[t,y] = ode45(F,time,x0);

%% Plotting time response and 3D phase diagram
figure('Name','Arneodo Attractor: States Time Response','NumberTitle','off')
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

figure('Name','Arneodo Attractor: 3D Phase Diagram','NumberTitle','off')
plot3(y(:,1),y(:,2),y(:,3))
grid on
title('3D Phase Diagram')
xlabel('x_{1}','FontWeight','bold')
ylabel('x_{2}','FontWeight','bold')
zlabel('x_{3}','FontWeight','bold')
