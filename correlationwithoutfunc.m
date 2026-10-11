
% Cross-Correlation Without Using Function
clc;
clear all;
close all;

% Input sequences
x = [1 2 3 4];
y = [1 2 1];

% Length of input sequences
Lx = length(x);
Ly = length(y);

% Full correlation lag range
lags = -(Ly-1):(Lx-1);

% Initialize correlation output
rxy = zeros(1, length(lags));

% Calculate cross-correlation manually
for i = 1:length(lags)
    lag = lags(i);

    for n = 1:Lx
        m = n - lag;

        if m >= 1 && m <= Ly
            rxy(i) = rxy(i) + x(n)*y(m);
        end
    end
end

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
stem(0:Lx-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(0:Ly-1, y, 'filled');
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
