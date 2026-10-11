
% Design and Analysis of IIR Filter
clc;
clear all;
close all;

% Signal parameters
Fs = 1000;
F1 = 10;
F2 = 50;
F3 = 80;
F4 = 120;

Ts = 1/Fs;
t = 0:Ts:1;

% Generate input signal
x = sin(2*pi*F1*t) + sin(2*pi*F2*t) + sin(2*pi*F3*t) + sin(2*pi*F4*t);

% Plot original signal
figure;
subplot(2,1,1);
plot(t,x);
xlabel('Time (s)');
ylabel('Amplitude');
title('Original Signal in Time Domain');
grid on;

subplot(2,1,2);
NFFT = length(x);
f = (0:NFFT-1)*Fs/NFFT;
plot(f,abs(fft(x)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Original Signal');
xlim([0 Fs/2]);
grid on;

% Design IIR Low-Pass Butterworth Filter
N = 5;
Fc = 60;
Wn = Fc/(Fs/2);

[b,a] = butter(N,Wn,'low');

% Frequency response of filter
figure;
freqz(b,a,1024,Fs);
title('IIR Butterworth Low-Pass Filter');

% Apply IIR filter
xfilter = filter(b,a,x);

% Plot filtered signal
figure;
subplot(2,1,1);
plot(t,xfilter);
xlabel('Time (s)');
ylabel('Amplitude');
title('Filtered Signal in Time Domain');
grid on;

subplot(2,1,2);
plot(f,abs(fft(xfilter)));
xlabel('Frequency (Hz)');
ylabel('Magnitude');
title('Magnitude Spectrum of Filtered Signal');
xlim([0 Fs/2]);
grid on;
