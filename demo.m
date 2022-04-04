%{
%   Demonstration of drawing the domain of linear inequalities:
%      Ax <= b, A \in R^{m*2}, b \in R^{m*1}
%
%   Written by Wu Si
%}
clear all; close all; clc;

A = [1 0; 1 1];
A = A./vecnorm(A')';
b = [1; 2];

bias        = [0; 0];
axes_range  = [-5, 5, -5, 5];
face_color  = 'c';
legend_name = '';

%% draw static half plane
figure(1); set(gcf, 'position', [0,0,1200,400]);
subplot(1, 3, 1); axis equal;
% draw the domain of the inequalities
H.f1_domain    = half_plane([], A, b, bias, axes_range, face_color, '');

%% draw the animation of half plane
% initialize the domain of the inequalities
subplot(1, 3, 2); axis equal;
H.f2_domain   = half_plane([], A, b, bias, axes_range, face_color, '');

% initialize the domain of each constraint of the inequalities
subplot(1, 3, 3); axis equal;
H.f2_domain_1 = half_plane([], A, b, bias, axes_range, 'r', '');
H.f2_domain_2 = half_plane([], A, b, bias, axes_range, 'b', '');

% animiation
for i = 1:100
    
    % time-varying inequalities
    A = [sin(i/100*2*pi), -cos(i/100*2*pi); 
         cos(i/100*2*pi),  sin(i/100*2*pi)];
    b = [1; 1];
    bias = [0; 1];

    % update the graphics
    H.f2_domain    = half_plane(H.f2_domain, A, b, bias);
    H.f2_domain_1  = half_plane(H.f2_domain_1, A(1, :), b(1, :), bias);
    H.f2_domain_2  = half_plane(H.f2_domain_2, A(2, :), b(2, :), bias);

    % drawnow;
    pause(0.1);
end
