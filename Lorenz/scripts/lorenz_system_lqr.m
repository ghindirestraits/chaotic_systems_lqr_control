%% Calculating the gain matrix for state-feedback control of Lorenz System
clear all
close all
clc

run('params.m')

syms xi1 xi2 xi3 u  % symbolic vars representing states and control input

% Matrix containing Thomas differential equations
dxi = [sigma*(xi2 - xi1) + u
       xi1*(rho - xi3) - xi2 + u
       xi1*xi2 - beta*xi3 + u];

% Equilibrium points
xie = [sqrt(beta*(rho-1))
       sqrt(beta*(rho-1))
       rho-1];

ue = 0;

% System's dynamic matrix
A = [ diff(dxi(1),xi1) diff(dxi(1),xi2) diff(dxi(1),xi3)
      diff(dxi(2),xi1) diff(dxi(2),xi2) diff(dxi(2),xi3)
      diff(dxi(3),xi1) diff(dxi(3),xi2) diff(dxi(3),xi3) ];

A = double(subs(A, [xi1;xi2;xi3], xie));

% System's input matrix
B = [ diff(dxi(1),u)
      diff(dxi(2),u)
      diff(dxi(3),u) ];

B = double(subs(B, u, ue));

% Penalties matrices
Q = .5*eye(3,3);
R = 1;

% Gain matrix
K = lqr(A,B,Q,R);
eig(A-B*K)  % poles allocated by gain
