
% Linear Convolution Using MATLAB Function
clc;
clear all;
close all;

% Input sequences
x = [1 2 3 4];
h = [1 2 1];

% Calculate convolution using conv()
y = conv(x, h);

% Display results
disp('Input sequence x[n]:');
disp(x);

disp('Impulse response h[n]:');
disp(h);

disp('Convolution output y[n]:');
disp(y);

% Plot signals
subplot(3,1,1);
stem(0:length(x)-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(0:length(h)-1, h, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(0:length(y)-1, y, 'filled');
title('Linear Convolution Output y[n]');
xlabel('n');
ylabel('Amplitude');
grid on;
