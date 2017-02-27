format long

A(1,1) = 1; A(2,1) = -1; A(3,1) = 0;
A(1,2) = 1; A(2,2) = 9;  A(3,2) = -1;
A(1,3) = 2; A(2,3) = 3;  A(3,3) = 3;

q0 = [1 1 1]';

tol = 1/10000;

k = 1000;

rho = 3;

[sigmai, qi] = metodo_potencia(A, q0, k, tol)
[sigmal, ql] = metodo_potenciainversa_shift(A, rho, q0, k, tol)
[V, D] = eig(A)
e  = max(abs(A*qi-sigmai*qi));




