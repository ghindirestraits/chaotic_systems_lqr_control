%% Settings for phase portrait animation
figh1 = figure('Name','Arneodo System: Drive-Response Visualization', ...
    'NumberTitle','off', 'Position', [0 0 960 1080]);
grid on
h1 = animatedline('MaximumNumPoints', 1000, 'Color', 'r', 'LineWidth', 1);
h2 = animatedline('MaximumNumPoints', 1000, 'Color', 'b', 'LineWidth', 1);

% axis_bnds = 20;
% axis_arr = zeros(1,2*dim);
% for i = 1:(2*dim)
%     if rem(i,2) ~= 0
%        axis_arr(i) = -1*axis_bnds;
%     else
%        axis_arr(i) = axis_bnds;
%     end
% end

% axis(axis_arr)
axis([-4,4,-6,6,-10,10])
legend('Drive signal', 'Response signal', 'Location', 'south')
view(dim)

%% Settings for the time response animation 
figh2 = figure('Name','Arneodo System: Drive-Response Visualization', ...
    'NumberTitle','off', 'Position', [960 0 960 1080]);

subplot(4,1,1)
grid on
h3 = animatedline('MaximumNumPoints', 100000, 'Color', 'r', 'LineWidth', 1);
h4 = animatedline('MaximumNumPoints', 100000, 'Color', 'b', 'LineWidth', 1);
axis([0,tFinal,-3,3])
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{1}')

subplot(4,1,2)
grid on
h5 = animatedline('MaximumNumPoints', 100000, 'Color', 'r', 'LineWidth', 1);
h6 = animatedline('MaximumNumPoints', 100000, 'Color', 'b', 'LineWidth', 1);
axis([0,tFinal,-3,3])
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{2}')

subplot(4,1,3)
grid on
h7 = animatedline('MaximumNumPoints', 100000, 'Color', 'r', 'LineWidth', 1);
h8 = animatedline('MaximumNumPoints', 100000, 'Color', 'b', 'LineWidth', 1);
axis([0,tFinal,-3,3])
legend('Drive signal', 'Response signal')
xlabel('time (s)')
ylabel('Amplitude')
title('Time response for state x_{3}')

subplot(4,1,4)
grid on
h9 = animatedline('MaximumNumPoints', 100000, 'Color', 'c', 'LineWidth', 1);
h10 = animatedline('MaximumNumPoints', 100000, 'Color', '#D95319', ...
    'LineWidth', 1);
h11 = animatedline('MaximumNumPoints', 100000, 'Color', '#0072BD', ...
    'LineWidth', 1);
axis([0,tFinal,-3,3])
legend('Error between \xi_1 and x_1', 'Error between \xi_2 and x_2', ...
    'Error between \xi_3 and x_3')
xlabel('time (s)')
ylabel('Amplitude')
title('$\dot{\xi} - \dot{x}$', 'Interpreter', 'latex')

%% Animation loop
% a = tic;
for k = 1:tFinal
    addpoints(h1, x_array(k,1), x_array(k,2), x_array(k,3))
    addpoints(h2, xi_array(k,1), xi_array(k,2), xi_array(k,3))
    addpoints(h3, t(k), x_array(k,1))
    addpoints(h4, t(k), xi_array(k,1))
    addpoints(h5, t(k), x_array(k,2))
    addpoints(h6, t(k), xi_array(k,2))
    addpoints(h7, t(k), x_array(k,3))
    addpoints(h8, t(k), xi_array(k,3))
    addpoints(h9, t(k), xi_array(k,1)-x_array(k,1))
    addpoints(h10, t(k), xi_array(k,2)-x_array(k,2))
    addpoints(h11, t(k), xi_array(k,3)-x_array(k,3))
    
    drawnow limitrate
    
%     b = toc(a);
%     if k > (tFinal - (tFinal/1))
%         if b > (1/1000)
%             drawnow
%             a = tic;
%         end
%     else
%         if b > (1/30)
%             drawnow
%             a = tic;
%         end
%     end
end

close(figh1,figh2)
