
% Cross-Correlation Using MATLAB Function
clc;
clear all;
close all;

% Input sequences
x = [1 2 3 4];
y = [1 2 1];

% Calculate cross-correlation
[rxy, lags] = xcorr(x, y);

% Display results
disp('Input sequence x[n]:');
disp(x);

disp('Input sequence y[n]:');
disp(y);

disp('Cross-correlation rxy[l]:');
disp(rxy);

disp('Corresponding lags:');
disp(lags);

% Plot signals
subplot(3,1,1);
stem(0:length(x)-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(0:length(y)-1, y, 'filled');
title('Input Signal y[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(lags, rxy, 'filled');
title('Cross-Correlation rxy[l]');
xlabel('Lag (l)');
ylabel('Amplitude');
grid on;
