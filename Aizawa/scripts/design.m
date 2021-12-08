%% Control design
% Global variables defition
global K xe ue

% Symbolic variables defintion
syms x1 x2 x3 u_

% Constants definition
M = 1;  % matrices number of rows
N = 3;  % matrices number of columns

% Equilibrium points
% states
xe = zeros(N,M);

% input
ue = 0;

%% Linearized System Dynamics
% Nonlinear space state modeling
x_dot = [ (x3 - b)*x1 - d*x2
          d*x1 + (x3 - b)*x2 + u_
          c + a*x3 - (1/3)*x3^3 - (x1^2 + x2^2)*(1 + e*x3) + f*x3*x1^3 + u_ ];

% System dynamic matrix for the linearized system
A = [ diff(x_dot(1),x1) diff(x_dot(1),x2) diff(x_dot(1),x3)
      diff(x_dot(2),x1) diff(x_dot(2),x2) diff(x_dot(2),x3)
      diff(x_dot(3),x1) diff(x_dot(3),x2) diff(x_dot(3),x3) ];

% System input matrix for the linearized system
B = [ diff(x_dot(1),u_)
      diff(x_dot(2),u_)
      diff(x_dot(3),u_) ];

A = double(subs(subs(A,[x1;x2;x3],xe),u_,ue));
B = double(subs(subs(B,[x1;x2;x3],xe),u_,ue));

Q = [ 1 0 0
      0 1 0
      0 0 1 ];  % states penalties matrix
R = .05;  % control input penalties matrix
   
K = lqr(A,B,Q,R);
