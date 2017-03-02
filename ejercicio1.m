format long

%Parte 1: Aplicar a una matriz A nuestro método potencia.
A(1,1) = 1; A(2,1) = -1; A(3,1) = 0;
A(1,2) = 1; A(2,2) = 9;  A(3,2) = -1;
A(1,3) = 2; A(2,3) = 3;  A(3,3) = 3;

q0 = [1,1,1]';

tol = 1/100000;

k = 1000;

[sigmai, qi] = metodo_potencia(A, q0, k, tol)

%`Parte 2: Obtener los eigenvalores/eigenvectores exactos para compararlos.
[V,D] = eig(A)

%Parte 3: Calcular las razones con la norma infinita de los eigenvalores
%exactos.
lambda = max(abs(D));
q = zeros(3);

for i=1:3
    B = A^i;
    B = B*q0;
    lambda = lambda(1)^i;
    q(:,i) = B./lambda;
end

r(1) = norm(q(:,2) - V(:,2),'inf')/norm(q(:,1) - V(:,1),'inf');
r(2) = norm(q(:,3) - V(:,3),'inf')/norm(q(:,2) - V(:,2),'inf')

%Parte 4: Calcular la razón del método potencia.
%
r_prima = abs(D(3,3)/D(1,1))
