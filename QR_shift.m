function [ lambdas ] = QR_shift( A, k, tol )
%Te regresa la aproximación de los eigenvalores en el vector "lambdas".
%   A es una matriz.
%   k es el número máximo de iteraciones.
%   tol es la tolerancia máxima de error(para salir antes del ciclo).
Ai = A;
x = size(A);
n = x(1);
pi = A(n,n);
%Buscamos que ña diagonal inferior sea aproximadamente cero para que la
%aproximación de los eigenvalores nos quede en la diagonal de Ai. 
while n>1
    i=1;
    while max(abs(A(n,1:n-1)))>tol && i<k
      %aplicamos QR hasta que suceda. 
       [Q,R] = qr(Ai - eye(n)*pi);
       Ai = R*Q + eye(n)*pi;  
       pi = Ai(n,n);
       i = i+1;
    end
    lambdas(n) = pi;
    n = n-1;
    Ai = Ai(1:n,1:n);
end

lambdas(1) = Ai(1,1);

lambdas = lambdas';



end
