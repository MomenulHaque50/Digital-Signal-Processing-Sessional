clc;
clear;
close all;

syms n z a;


fprintf(' 1. INVERSE Z-TRANSFORM OF z/(z-a)\n');
X1 = z / (z - a);
x1 = iztrans(X1, z, n);
disp('Original Z-Transform X(z) =');
disp(X1);
disp('Generated Time-Domain Signal x[n] =');
disp(simplify(x1));

fprintf(' 2. INVERSE Z-TRANSFORM OF z/(z-1)\n');
X2 = z / (z - 1);
x2 = iztrans(X2, z, n);
disp('Original Z-Transform X(z) =');
disp(X2);
disp('Generated Time-Domain Signal x[n] =');
disp(simplify(x2));

fprintf(' 3. INVERSE Z-TRANSFORM OF LINEAR FUNCTION RESULT\n');
X3 = 5*z/(3*(z-1)) + 2*z/(3*(z-1)^2);
x3 = iztrans(X3, z, n);
disp('Original Z-Transform X(z) =');
disp(X3);
disp('Generated Time-Domain Signal x[n] =');
disp(simplify(x3));

fprintf(' 4. INVERSE Z-TRANSFORM OF SINE FUNCTION\n');
X4 = z * sin(2) / (z^2 - 2*z*cos(2) + 1);
x4 = iztrans(X4, z, n);
disp('Original Z-Transform X(z) =');
disp(X4);
disp('Generated Time-Domain Signal x[n] =');
disp(simplify(x4));

fprintf(' 5. INVERSE Z-TRANSFORM USING PARTIAL FRACTIONS\n');
X5 = z / ((z - 1)*(z - 2));
disp('Original Z-Transform X(z) =');
disp(X5);
disp('Partial Fraction Expansion =');
disp(partfrac(X5, z));
x5 = iztrans(X5, z, n);
disp('Generated Time-Domain Signal x[n] =');
disp(simplify(x5));