%% Parameters for the Thomas system simulation
% Thomas equations coefficients
b = -0.19;

% Systems' initial conditions
x = [ 1;2;3 ];  % initial conditions for the drive system
xi = [ 3;7.1;1 ];       % initial conditions for the response system
  
% Simulation parameters
u        = 0;                % initial condition for the control signal
dt       = 1e-3;             % simulation timestep
dim      = 3;                % define systems' dimension
tFinal   = 100000;            % simulation's max number of points
x_array  = zeros(tFinal,3);  % preallocating space for drive's data
xi_array = zeros(tFinal,3);  % preallocating space for response's data
