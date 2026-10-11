clc;
clear;
close all;

syms s t a beta;


fprintf(' 1. INVERSE LAPLACE OF 1 (Impulse)\n');
F1 = 1;
f1 = ilaplace(F1, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F1);
disp('Generated Time-Domain f(t) =');
disp(f1);

fprintf(' 2. INVERSE LAPLACE OF 1/s (Step)\n');
F2 = 1/s;
f2 = ilaplace(F2, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F2);
disp('Generated Time-Domain f(t) =');
disp(f2);

fprintf(' 3. INVERSE LAPLACE OF 1/s^2 (Ramp)\n');
F3 = 1/s^2;
f3 = ilaplace(F3, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F3);
disp('Generated Time-Domain f(t) =');
disp(f3);

fprintf(' 4. INVERSE LAPLACE OF 1/(s+a) (Exponential)\n');
F4 = 1/(s + a);
f4 = ilaplace(F4, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F4);
disp('Generated Time-Domain f(t) =');
disp(simplify(f4));

fprintf(' 5. INVERSE LAPLACE OF 1/(s+a)^2 (Damped Ramp)\n');
F5 = 1/(s + a)^2;
f5 = ilaplace(F5, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F5);
disp('Generated Time-Domain f(t) =');
disp(simplify(f5));

fprintf(' 6. INVERSE LAPLACE OF beta/(s^2 + beta^2) (Sine)\n');
F6 = beta / (s^2 + beta^2);
f6 = ilaplace(F6, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F6);
disp('Generated Time-Domain f(t) =');
disp(simplify(f6));

fprintf(' 7. INVERSE LAPLACE OF s/(s^2 + beta^2) (Cosine)\n');
F7 = s / (s^2 + beta^2);
f7 = ilaplace(F7, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F7);
disp('Generated Time-Domain f(t) =');
disp(simplify(f7));

fprintf(' 8. INVERSE LAPLACE OF beta/((s+a)^2 + beta^2) (Damped Sine)\n');
F8 = beta / ((s + a)^2 + beta^2);
f8 = ilaplace(F8, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F8);
disp('Generated Time-Domain f(t) =');
disp(simplify(f8));

fprintf(' 9. INVERSE LAPLACE OF (s+a)/((s+a)^2 + beta^2) (Damped Cosine)\n');
F9 = (s + a) / ((s + a)^2 + beta^2);
f9 = ilaplace(F9, s, t);
disp('Original Laplace-Domain F(s) =');
disp(F9);
disp('Generated Time-Domain f(t) =');
disp(simplify(f9));