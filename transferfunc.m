clc;
clear;
close all;


fprintf(' 1. H1(s) = 5s / (s^2 + 15s + 25)\n');
num1 = [5 0];
den1 = [1 15 25];
H1 = tf(num1, den1);
disp('Original expression: H1(s) = 5s / (s^2 + 15s + 25)');
disp('Generated Transfer Function H1(s):');
disp(H1);

fprintf(' 2. H2(z) = 0.5 / (1 - 1.5z^(-1) + 0.5z^(-2))\n');
% Using z^-1 as the variable for discrete-time transfer function
z_var = tf('z', [], 'variable', 'z^-1');
H2 = 0.5 / (1 - 1.5*z_var^(-1) + 0.5*z_var^(-2));
disp('Original expression: H2(z) = 0.5 / (1 - 1.5z^-1 + 0.5z^-2)');
disp('Generated Transfer Function H2(z):');
disp(H2);


fprintf(' 3. H3(z) = z^2 / (2z^2 - 3z + 1)\n');
num3 = [1 0 0];
den3 = [2 -3 1];
H3 = tf(num3, den3); % Default discrete time variable z
disp('Original expression: H3(z) = z^2 / (2z^2 - 3z + 1)');
disp('Generated Transfer Function H3(z):');
disp(H3);

fprintf(' 4. H4(s) = 100(s-3)(s+4) / [s(s+2)(s+10)(s+15)]\n');
num4 = 100 * conv([1 -3], [1 4]);
den4 = conv(conv([1 0], [1 2]), conv([1 10], [1 15]));
H4 = tf(num4, den4);
disp('Original expression: H4(s) = 100(s-3)(s+4) / [s(s+2)(s+10)(s+15)]');
disp('Generated Transfer Function H4(s):');
disp(H4);

fprintf(' 5. H5 = 7(z-1)(z-2)(z-3) / [(z-6)(z-5)(z-4)]\n');
num5 = 7 * conv(conv([1 -1], [1 -2]), [1 -3]);
den5 = conv(conv([1 -6], [1 -5]), [1 -4]);
H5 = tf(num5, den5);
disp('Original expression: H5 = 7(z-1)(z-2)(z-3) / [(z-6)(z-5)(z-4)]');
disp('Generated Transfer Function H5:');
disp(H5);