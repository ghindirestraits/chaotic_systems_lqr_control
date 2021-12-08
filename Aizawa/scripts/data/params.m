%% Parameters for the Aizawa system simulation
% Aizawa equations coefficients
a = .95;
b = .7;
c = .6;
d = 3.5;
e = .25;
f = .1;

% Systems' initial conditions
x  = [ 1;0;0 ];  % initial conditions for the drive system
xi = 5*x;         % initial conditions for the response system

% Simulation parameters
u        = 0;                  % initial condition for the control signal
dt       = 1e-3;               % simulation timestep
dim      = 3;                  % define systems' dimension
tFinal   = 30000;              % simulation's max number of points
x_array  = zeros(tFinal,dim);  % preallocating space for drive's data
xi_array = zeros(tFinal,dim);  % preallocating space for response's data
