clc;
clear;
close all;


% Consider a discrete-time system described by the difference equation:
% y[n] - 0.5y[n-1] = x[n]  -->  H(z) = 1 / (1 - 0.5z^-1)

num_d = [1];          % Numerator coefficients
den_d = [1, -0.5];    % Denominator coefficients

% Compute impulse response using impz
n_samples = 20;
[h_disc, n] = impz(num_d, den_d, n_samples);

% Print original system and generated response to Command Window
disp('Original System Transfer Function: H(z) = 1 / (1 - 0.5z^-1)');
disp('Generated Impulse Response h[n] (First 10 values):');
disp(h_disc(1:10)');

% Consider a continuous-time system described by the transfer function:
% H(s) = 1 / (s^2 + 3s + 2)

num_c = [1];          % Numerator coefficients
den_c = [1, 3, 2];    % Denominator coefficients

% Create continuous-time transfer function object
sys_c = tf(num_c, den_c);

% Compute impulse response time vector and output
[h_cont, t] = impulse(sys_c);

% Print original system and generated response summary to Command Window
disp('Original System Transfer Function H(s):');
disp(sys_c);
disp('Generated Impulse Response h(t) summary (First 5 values):');
disp([t(1:5), h_cont(1:5)]);


figure('Name', 'LTI System Impulse Responses', 'Position', [100, 100, 900, 600]);

% Plot 1: Discrete-Time Impulse Response
subplot(2, 1, 1);
stem(n, h_disc, 'filled', 'LineWidth', 1.5, 'MarkerSize', 6);
title('Discrete-Time Impulse Response: h[n]');
xlabel('Sample Index (n)');
ylabel('Amplitude');
grid on;

% Plot 2: Continuous-Time Impulse Response
subplot(2, 1, 2);
plot(t, h_cont, 'LineWidth', 1.8, 'Color', 'r');
title('Continuous-Time Impulse Response: h(t)');
xlabel('Time (seconds)');
ylabel('Amplitude');
grid on;