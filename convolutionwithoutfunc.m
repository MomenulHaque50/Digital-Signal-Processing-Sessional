
% Linear Convolution Without Using Function
clc;
clear all;
close all;

% Input sequences
x = [1 2 3 4];
h = [1 2 1];

% Length of input sequences
Lx = length(x);
Lh = length(h);

% Length of convolution output
Ly = Lx + Lh - 1;

% Initialize output sequence
y = zeros(1, Ly);

% Calculate convolution manually
for n = 1:Ly
    for k = 1:Lx
        if (n-k+1 >= 1) && (n-k+1 <= Lh)
            y(n) = y(n) + x(k)*h(n-k+1);
        end
    end
end

% Display results
disp('Input sequence x[n]:');
disp(x);

disp('Impulse response h[n]:');
disp(h);

disp('Convolution output y[n]:');
disp(y);

% Plot signals
subplot(3,1,1);
stem(0:Lx-1, x, 'filled');
title('Input Signal x[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,2);
stem(0:Lh-1, h, 'filled');
title('Impulse Response h[n]');
xlabel('n');
ylabel('Amplitude');
grid on;

subplot(3,1,3);
stem(0:Ly-1, y, 'filled');
title('Linear Convolution Output y[n]');
xlabel('n');
ylabel('Amplitude');
grid on;
