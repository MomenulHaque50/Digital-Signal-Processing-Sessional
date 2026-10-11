clc;
clear;
close all;

% Frequency-domain signal
X = [4 -2i 0 2i];

% Number of samples
N = length(X);

% IDFT
x = ifft(X);

% Display result
disp('Frequency Domain Signal X[k]:');
disp(X);

disp('Time Domain Signal x[n]:');
disp(x);

% Magnitude of frequency-domain signal
Magnitude = abs(X);

% Plot frequency domain
figure;

subplot(1,2,1);
stem(0:N-1, Magnitude, 'filled');
xlabel('Frequency Index k');
ylabel('|X[k]|');
title('Frequency Domain');
grid on;

% Plot time domain
subplot(1,2,2);
stem(0:N-1, x, 'filled');
xlabel('Sample n');
ylabel('Amplitude');
title('Time Domain after IDFT');
grid on;