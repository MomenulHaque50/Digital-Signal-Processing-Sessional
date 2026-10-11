
clc;
clear;
close all;

syms t s a beta;


fprintf(' 1. IMPULSE FUNCTION\n');
f1 = dirac(t);
F1 = laplace(f1, t, s);
disp('Original Time-Domain f(t) =');
disp(f1);
disp('Generated Laplace-Domain F(s) =');
disp(F1);

fprintf(' 2. STEP FUNCTION\n');
f2 = 1; % or heaviside(t)
F2 = laplace(f2, t, s);
disp('Original Time-Domain f(t) =');
disp(f2);
disp('Generated Laplace-Domain F(s) =');
disp(F2);


fprintf(' 3. RAMP FUNCTION\n');
f3 = t;
F3 = laplace(f3, t, s);
disp('Original Time-Domain f(t) =');
disp(f3);
disp('Generated Laplace-Domain F(s) =');
disp(F3);

fprintf(' 4. EXPONENTIAL FUNCTION\n');
f4 = exp(-a*t);
F4 = laplace(f4, t, s);
disp('Original Time-Domain f(t) =');
disp(f4);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F4));

fprintf(' 5. DAMPED RAMP FUNCTION\n');
f5 = t * exp(-a*t);
F5 = laplace(f5, t, s);
disp('Original Time-Domain f(t) =');
disp(f5);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F5));

fprintf(' 6. SINE FUNCTION\n');
f6 = sin(beta*t);
F6 = laplace(f6, t, s);
disp('Original Time-Domain f(t) =');
disp(f6);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F6));

fprintf(' 7. COSINE FUNCTION\n');
f7 = cos(beta*t);
F7 = laplace(f7, t, s);
disp('Original Time-Domain f(t) =');
disp(f7);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F7));

fprintf(' 8. DAMPED SINE FUNCTION\n');
f8 = exp(-a*t) * sin(beta*t);
F8 = laplace(f8, t, s);
disp('Original Time-Domain f(t) =');
disp(f8);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F8));

fprintf(' 9. DAMPED COSINE FUNCTION\n');
f9 = exp(-a*t) * cos(beta*t);
F9 = laplace(f9, t, s);
disp('Original Time-Domain f(t) =');
disp(f9);
disp('Generated Laplace-Domain F(s) =');
disp(simplify(F9));