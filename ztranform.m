clc;
clear;
close all;

syms n z a w;

fprintf(' 1. CONSTANT SIGNAL\n');
x1 = 1;
X1 = ztrans(x1, n, z);
disp('Original Signal x[n] =');
disp(x1);
disp('Generated Z-Transform X(z) =');
disp(X1);

fprintf(' 2. LINEAR FUNCTION\n');
x2 = (2*n + 5)/3;
X2 = ztrans(x2, n, z);
disp('Original Signal x[n] =');
disp(x2);
disp('Generated Z-Transform X(z) (Simplified) =');
disp(simplify(X2));


fprintf(' 3. EXPONENTIAL SIGNAL\n');
x3 = a^n;
X3 = ztrans(x3, n, z);
disp('Original Signal x[n] =');
disp(x3);
disp('Generated Z-Transform X(z) =');
disp(simplify(X3));

fprintf(' 4. SINE SIGNAL\n');
x4 = sin(w*n);
X4 = ztrans(x4, n, z);
disp('Original Signal x[n] =');
disp(x4);
disp('Generated Z-Transform X(z) =');
disp(simplify(X4));


fprintf(' 5. COSINE SIGNAL\n');
x5 = cos(w*n);
X5 = ztrans(x5, n, z);
disp('Original Signal x[n] =');
disp(x5);
disp('Generated Z-Transform X(z) =');
disp(simplify(X5));

fprintf(' 6. DELAYED IMPULSE SIGNAL\n');
x6 = kroneckerDelta(n - 2);
X6 = ztrans(x6, n, z);
disp('Original Signal x[n] =');
disp(x6);
disp('Generated Z-Transform X(z) =');
disp(X6);