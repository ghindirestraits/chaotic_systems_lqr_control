%% Thomas Strange Attractor Equations
% written by Gabriel Heberle - September 6th, 2021
%
% System of Equations:
%
%      dx
%     ---- = sin(y) - b*x
%      dt
%
%      dy
%     ---- = sin(z) - b*y
%      dt
%
%      dz
%     ---- = sin(x) - b*z
%      dt
%

clear all
close all
clc

% Loading simulation parameters
addpath('data')
run params

%% Using MATLAB built-in solver
x0 = [ 5;2.7;0 ];
time = 0:dt:1000;  % simulation time
F = @(t,x) [sin(x(2)) + b*x(1)
            sin(x(3)) + b*x(2)
            sin(x(1)) + b*x(3)];
[t,y] = ode45(F,time,x0);

%% Plotting time response and 3D phase diagram

figure('Name','Thomas Attractor: Time Response','NumberTitle','off')
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

figure('Name','Thomas Attractor: 3D Phase Diagram','NumberTitle','off')
plot3(y(:,1),y(:,2),y(:,3))
grid on
title('3D Phase Diagram')
xlabel('x_{1}','FontWeight','bold')
ylabel('x_{2}','FontWeight','bold')
zlabel('x_{3}','FontWeight','bold')
