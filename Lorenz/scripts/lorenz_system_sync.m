%% Lorenz Systems Synchronization
% This code aims to plot the synchronization of two chaotic elements
% belonging to the Lorenz System's family of equations
% written by Gabriel Heberle
%
% The Lorenz equations are:
%
%  dx
% ---- = sigma*(y - x)
%  dt
% 
%  dy 
% ---- = x*(rho - z) - y
%  dt
% 
%  dz
% ---- = x*y - beta*z
%  dt
% 
% with parameters sigma = 10, rho = 28 and beta = 8/3.
% 

clear all
close all
clc

%% Loading simulation parameters
addpath('data')
run params
run design

%% Simulation
for j = 1:tFinal
    % Drive System
    xd(1) = (sigma*(x(2) - x(1)))*dt;
    xd(2) = (x(1)*(rho - x(3)) - x(2))*dt;
    xd(3) = (x(1)*x(2) - beta*x(3))*dt;

    % Response System
    xid(1) = (sigma*(xi(2) - xi(1)) + u)*dt;
    xid(2) = (xi(1)*(rho - xi(3)) - xi(2))*dt;
    xid(3) = (xi(1)*xi(2) - beta*xi(3))*dt;

    % Savin current coordinates
    x_array(j,:) = x;
    xi_array(j,:) = xi;

    % Updating old coordinates
    x(:,:) = x + xd';
    xi(:,:) = xi + xid';

    % Calculating error between states
    u = control(x,xi);
end

%% Response Visualization
t = linspace(0, tFinal, tFinal);
% run anim

%% Plotting time response and 3D phase diagram
figure('Name', 'Lorenz Attractor: 3D Phase Diagram', 'NumberTitle', ...
    'off', 'Position', [0 0 960 1080])
plot3(x_array(:,1),x_array(:,2),x_array(:,3),'r')
hold on
plot3(xi_array(:,1),xi_array(:,2),xi_array(:,3),'b')
grid on
text(x_array(1,1),x_array(1,2),x_array(1,3), 'Start of x')
text(xi_array(1,1),xi_array(1,2),xi_array(1,3), 'Start of \xi')
text(x_array(tFinal,1),x_array(tFinal,2),x_array(tFinal,3), ...
    'End of x')
text(xi_array(tFinal,1),xi_array(tFinal,2),xi_array(tFinal,3)-3, ...
    'End of \xi')
legend('Drive signal', 'Response signal', 'Location', 'south')
title('3D Phase Diagram')
xlabel('x_{1} / \xi_{1}','FontWeight','bold')
ylabel('x_{2} / \xi_{2}','FontWeight','bold')
zlabel('x_{3} / \xi_{3}','FontWeight','bold')

figure('Name', 'Lorenz Attractor: States Time Response', 'NumberTitle', ...
    'off', 'Position', [960 0 960 1080])
hold on

subplot(4,1,1)
plot(t,x_array(:,1),'r')
hold on
plot(t,xi_array(:,1),'b')
grid on
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{1} / \xi_{1}')

subplot(4,1,2)
plot(t,x_array(:,2),'r')
hold on
plot(t,xi_array(:,2),'b')
grid on
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{2} / \xi_{2}')

subplot(4,1,3)
plot(t,x_array(:,3),'r')
hold on
plot(t,xi_array(:,3),'b')
grid on
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{3} / \xi_{3}')

subplot(4,1,4)
plot(t,xi_array(:,1)-x_array(:,1),'c')
hold on
plot(t,xi_array(:,2)-x_array(:,2),'Color','#D95319')
hold on
plot(t,xi_array(:,3)-x_array(:,3),'Color','#0072BD')
grid on
legend('Error between \xi_1 and x_1', 'Error between \xi_2 and x_2', ...
    'Error between \xi_3 and x_3')
xlabel('time (s)')
ylabel('Amplitude')
title('$\dot{\xi} - \dot{x}$', 'Interpreter', 'latex')
