%% Parameters for the Lorenz system simulation
% Lorenz equations coefficients
rho   = 28;
beta  = 8/3;
sigma = 10;

% System initial conditions
x  = [ 10;0;-20 ];  % initial conditions for the drive system
xi = [ 45;37;0 ];   % initial conditions for the response system

% Simulation parameters
u        = 0;                % initial condition for the control signal
dt       = 1e-3;             % simulation timestep
dim      = 3;                % define systems' dimension
tFinal   = 10000;            % simulation's max number of points
x_array  = zeros(tFinal,3);  % preallocating space for drive's data
xi_array = zeros(tFinal,3);  % preallocating space for response's data
