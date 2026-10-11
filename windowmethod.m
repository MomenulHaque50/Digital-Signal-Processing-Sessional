clc;
clear;
close all;

%% 1. Define Filter Specifications
fs = 8000;           % Sampling frequency (Hz)
fc = 1500;           % Cutoff frequency (Hz)
N = 40;              % Filter order (number of taps is N+1)

% Normalize the cutoff frequency with respect to the Nyquist frequency (fs/2)
Wn = fc / (fs / 2);

%% 2. Design Filters Using Rectangular, Hamming, and Hanning Windows
% Rectangular Window
win_rect = rectwin(N+1);
b_rect = fir1(N, Wn, 'low', win_rect);

% Hamming Window
win_hamm = hamming(N+1);
b_hamm = fir1(N, Wn, 'low', win_hamm);

% Hanning (Hann) Window
win_hann = hann(N+1);
b_hann = fir1(N, Wn, 'low', win_hann);

%% 3. Create a Test Signal (Low-frequency sine wave + High-frequency noise)
t = 0:1/fs:0.015;                       % Time vector (15 ms duration)
f_signal = 200;                         % 200 Hz signal of interest
original_signal = sin(2*pi*f_signal*t); 
noise = 0.5 * sin(2*pi*3000*t);         % 3000 Hz high-frequency noise
noisy_signal = original_signal + noise; % Combined input signal (Original to filter)

%% 4. Apply All Three Filters to the Noisy Signal
filtered_rect = filter(b_rect, 1, noisy_signal);
filtered_hamm = filter(b_hamm, 1, noisy_signal);
filtered_hann = filter(b_hann, 1, noisy_signal);

%% 5. Print Original and Generated Results to Command Window
fprintf('Sampling Frequency: %d Hz\n', fs);
fprintf('Cutoff Frequency: %d Hz\n', fc);
fprintf('Filter Order: %d (Taps: %d)\n\n', N, N+1);

disp('--- ORIGINAL INPUT SIGNAL ---');
disp(['Time vector length: ', num2str(length(t)), ' samples']);
disp(['Signal components: 200 Hz Sine + 3000 Hz Noise']);

disp('\n--- GENERATED FILTER COEFFICIENTS (First 5 taps) ---');
disp('Rectangular Filter (b_rect):'); disp(b_rect(1:5));
disp('Hamming Filter (b_hamm):');   disp(b_hamm(1:5));
disp('Hanning Filter (b_hann):');   disp(b_hann(1:5));

disp('\n--- GENERATED FILTERED SIGNALS (First 5 samples) ---');
disp('Noisy Signal (Input):');       disp(noisy_signal(1:5));
disp('Rectangular Filtered Output:'); disp(filtered_rect(1:5));
disp('Hamming Filtered Output:');     disp(filtered_hamm(1:5));
disp('Hanning Filtered Output:');     disp(filtered_hann(1:5));

%% 6. Plotting Results
figure('Name', 'Window Methods Comparison: Rectangular, Hamming, Hanning', 'Position', [100, 100, 1000, 850]);

% Plot 1: Window Shapes
subplot(3, 1, 1);
stem(win_rect, 'r', 'LineWidth', 1, 'Marker', 'none');
hold on;
stem(win_hamm, 'g', 'LineWidth', 1, 'Marker', 'none');
stem(win_hann, 'b', 'LineWidth', 1, 'Marker', 'none');
hold off;
title('Window Functions Comparison');
xlabel('Sample Index');
ylabel('Amplitude');
legend('Rectangular', 'Hamming', 'Hanning', 'Location', 'northeast');
grid on;

% Plot 2: Frequency Response (Magnitude in dB)
subplot(3, 1, 2);
[H_r, freq] = freqz(b_rect, 1, 512, fs);
[H_hm, ~]   = freqz(b_hamm, 1, 512, fs);
[H_hn, ~]   = freqz(b_hann, 1, 512, fs);

plot(freq, 20*log10(abs(H_r)), 'r', 'LineWidth', 1.2);
hold on;
plot(freq, 20*log10(abs(H_hm)), 'g', 'LineWidth', 1.2);
plot(freq, 20*log10(abs(H_hn)), 'b', 'LineWidth', 1.2);
hold off;
title('Frequency Response of Designed FIR Filters');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');
legend('Rectangular', 'Hamming', 'Hanning', 'Location', 'northeast');
grid on;
ylim([-100, 10]);

% Plot 3: Time-Domain Original vs Filtered Outputs
subplot(3, 1, 3);
plot(t * 1000, noisy_signal, 'Color', [0.7 0.7 0.7], 'LineWidth', 1.5);
hold on;
plot(t * 1000, filtered_rect, 'r--', 'LineWidth', 1.2);
plot(t * 1000, filtered_hamm, 'g-.', 'LineWidth', 1.2);
plot(t * 1000, filtered_hann, 'b-', 'LineWidth', 1.5);
hold off;
title('Time-Domain Comparison: Original Noisy Signal vs Filtered Outputs');
xlabel('Time (ms)');
ylabel('Amplitude');
legend('Original Noisy Signal', 'Rectangular Filtered', 'Hamming Filtered', 'Hanning Filtered', 'Location', 'northeast');
grid on;