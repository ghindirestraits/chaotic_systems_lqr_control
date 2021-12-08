%% Thomas System (Thomas cyclically symmetric attractor)
% A visualization of two agnostic systems modelled using
% Thomas' equations being synchronized using a gain control
%
% written by Gabriel Heberle

clear all
close all
clc
%% Preconditions loading
run('params.m')

%% Running simulation
simData = sim('thomas_sim2.slx');

%% Data processing
t           = simData.thomas.Time;         % simulation's time data
thomasDrive = simData.thomas.Data(:,1:2);  % drive systems simulation data
thomasResp  = simData.thomas.Data(:,3:4);  % response system simulation data

%% Visualization

y_ = thomasDrive(:,1);
z_ = thomasResp(:,1);
y = thomasDrive(:,2);
z = thomasResp(:,2);

figure('Name','Thomas System: Time Response','NumberTitle','off');

% Time Response
% State 1

% State 2
subplot(2,1,1)
hold on
plot(t,y_,'b')
plot(t,y,'r')
grid on
xlabel('time_{seconds}','FontWeight','bold')
ylabel('Amplitude','FontWeight','bold')
legend()

% State 3
subplot(2,1,2)
hold on
plot(t,z_,'b')
plot(t,z,'r')
grid on
xlabel('time_{seconds}','FontWeight','bold')
ylabel('Amplitude','FontWeight','bold')
legend()

figure('Name','Thomas System: 3D Phase Diagram','NumberTitle','off');

plot(thomasDrive(:,1), thomasDrive(:,2), 'b-', 'DisplayName','Drive')
hold on
plot(thomasResp(:,1), thomasResp(:,2), 'r-', 'DisplayName','Response')
grid on
title('3D Phase Diagram')
legend()

%% Animation
% figh = figure('Name','Thomas System: 3D Phase Diagram','NumberTitle','off');
% 
% for k=1:length(t)
%     clf  % clear figure
%     
%     x1_d = thomasDrive(k,1);
%     x1_r = thomasResp(k,1);
%     x2_d = thomasDrive(k,2);
%     x2_r = thomasResp(k,2);
%     x3_d = thomasDrive(k,3);
%     x3_r = thomasResp(k,3);
%     
%     % Phase diagram
%     plot3(x1_d, x2_d, x3_d, 'g.', 'LineWidth', 3, 'MarkerSize', 25)
%     hold on
%     plot3(x1_r, x2_r, x3_r, 'y.', 'LineWidth', 3, 'MarkerSize', 25)
% %     hold on
% %     plot3(thomasDrive(:,1), thomasDrive(:,2), thomasDrive(:,3), 'b-', ...
% %         'LineWidth', 2, 'DisplayName','Drive')
% %     hold on
% %     plot3(thomasResp(:,1), thomasResp(:,2), thomasResp(:,3), 'r-', ...
% %         'LineWidth', 2, 'MarkerSize', 15,'DisplayName','Response')
%     grid on
%     title('3D Phase Diagram')
%     legend()
%     xlabel('x_{1}','FontWeight','bold')
%     ylabel('x_{2}','FontWeight','bold')
%     zlabel('x_{3}','FontWeight','bold')
%     
%     drawnow
% 
% %     movieVector(k) = getframe(figh);
% end

% vidWriter = VideoWriter('thomas_PhaseDiagram', 'MPEG-4');
% vidWriter.FrameRate = 25;
% open(vidWriter);
% writeVideo(vidWriter, movieVector);
% close(vidWriter);
