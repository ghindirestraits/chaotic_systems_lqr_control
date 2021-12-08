%% Parameters for the Rössler system simulation
% Rössler equations coefficients
a = 0.2;
b = 0.2;
c = 5.7;

% Systems' initial conditions
x = [ 5;7;0 ];      % initial conditions for the drive system
xi = [ 6;5;14 ];  % initial conditions for the response system
  
% Simulation parameters
u        = 0;                % initial condition for the control signal
dt       = 1e-3;             % simulation timestep
dim      = 3;                % define systems' dimension
tFinal   = 50000;            % simulation's max number of points
x_array  = zeros(tFinal,3);  % preallocating space for drive's data
xi_array = zeros(tFinal,3);  % preallocating space for response's data
