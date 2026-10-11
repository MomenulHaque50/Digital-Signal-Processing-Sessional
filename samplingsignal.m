
% Sampling, Nyquist Rate, Oversampling and Undersampling
clc;
clear all;
close all;

% Original signal parameters
f1 = 10;                  % Signal frequency in Hz
A = 1;                    % Amplitude
t = 0:0.0001:0.5;         % Fine time vector (approx. continuous signal)
x = A*sin(2*pi*f1*t);     % Original signal

% Nyquist sampling frequency
Fn = 2*f1;

% Sampling frequencies
Fs_nyquist = Fn;          % Nyquist-rate sampling
Fs_over = 5*Fn;           % Oversampling
Fs_under = 1.5*f1;        % Undersampling (below Nyquist)

% Sampled signals
tn = 0:1/Fs_nyquist:0.5;
xn = A*sin(2*pi*f1*tn);

to = 0:1/Fs_over:0.5;
xo = A*sin(2*pi*f1*to);

tu = 0:1/Fs_under:0.5;
xu = A*sin(2*pi*f1*tu);

% Plot original signal
figure;

subplot(4,1,1);
plot(t,x,'b','LineWidth',1.5);
title('Original Signal (10 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Nyquist-rate sampling
subplot(4,1,2);
plot(t,x,'b','LineWidth',1.2);
hold on;
stem(tn,xn,'r','filled');
title('Nyquist-Rate Sampling (Fs = 20 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original','Samples');
grid on;

% Oversampling
subplot(4,1,3);
plot(t,x,'b','LineWidth',1.2);
hold on;
stem(to,xo,'r','filled');
title('Oversampling (Fs = 100 Hz)');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original','Samples');
grid on;

% Undersampling
subplot(4,1,4);
plot(t,x,'b','LineWidth',1.2);
hold on;
stem(tu,xu,'r','filled');
title('Undersampling (Fs = 15 Hz) - Aliasing');
xlabel('Time (s)');
ylabel('Amplitude');
legend('Original','Samples');
grid on;
