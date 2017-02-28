format long

A(1,1) = 1; A(2,1) = -1; A(3,1) = 0;
A(1,2) = 1; A(2,2) = 9;  A(3,2) = -1;
A(1,3) = 2; A(2,3) = 3;  A(3,3) = 3;

q0 = [12 -1 1]';

tol = 1/1000;

k = 1000;

rho = 3;

[lambdasi] = QR_simple(A, k, tol)
[lambdasl] = QR_shift(A, k, tol)
[V, D] = eig(A)


