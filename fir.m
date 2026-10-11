%Design for FIR Filter
clc;
clear all;
close all;
Fs=1000;
F1=10; F2=50; F3=80; F4=120;
Ts=1/Fs;
t=0:Ts:1;
x=sin(2*pi*F1*t)+sin(2*pi*F2*t)+sin(2*pi*F3*t)+sin(2*pi*F4*t);
subplot(2,1,1)
plot(x);
xlabel('time')
ylabel('Amplitude')
subplot(2,1,2)
plot(abs(fft(x)))
xlabel('Freuency')
ylabel('Amplitude of FT')
title('Magnitude spectrum of original signal')
% Design for FIR using windowing method
N=151;
Fc=60;
wc=(2*Fc)/Fs;
b=fir1(N,wc);
figure;
freqz(b,1);
xfilter=filter(b,1,x)
figure;
subplot(2,1,1)
plot(xfilter);
subplot(2,1,2)
plot(abs(fft(xfilter)))
xlabel('Frequency')
ylabel('Amplitude of FT')
title('Magnitude spectrum of filtered signal')