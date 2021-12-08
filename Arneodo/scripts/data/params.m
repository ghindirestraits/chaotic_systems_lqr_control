%% Parameters for the Arneodo system simulation
% Arneodo equations coefficients
beta = -3.5;
alpha = 5.5;

% Systems' initial conditions
x  = [ 0;0;.1 ];  % initial conditions for the drive system
xi = 50*x;        % initial conditions for the response system        

% Simulation parameters
u        = 0;                % initial condition for the control signal
dt       = 1e-3;             % simulation timestep
dim      = 3;                % define systems' dimension
tFinal   = 30000;            % simulation's max number of points
x_array  = zeros(tFinal,3);  % preallocating space for drive's data
xi_array = zeros(tFinal,3);  % preallocating space for response's data
