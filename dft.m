clc;
clear;
close all;

% Discrete signal
x = [1 2 1 0];

% Number of samples
N = length(x);

% DFT using MATLAB built-in function
X = fft(x);

% Magnitude
Magnitude = abs(X);

% Sampling frequency
Fs = 1000;

% Frequency axis
f = (0:N-1)*(Fs/N);

% Display results
disp('Original Signal:');
disp(x);

disp('DFT Result:');
disp(X);

disp('Magnitude:');
disp(Magnitude);

disp('Frequency (Hz):');
disp(f);

% Plot original signal
figure;

subplot(2,1,1);
stem(0:N-1, x, 'filled');
xlabel('Sample n');
ylabel('Amplitude');
title('Discrete-Time Signal');
grid on;

% Plot magnitude spectrum
subplot(2,1,2);
stem(f, Magnitude, 'filled');
xlabel('Frequency (Hz)');
ylabel('|X[k]|');
title('Magnitude Spectrum');
grid on;