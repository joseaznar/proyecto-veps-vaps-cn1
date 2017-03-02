function [ lambdas ] = QR_simple( A, k, tol )
%Te regresa la aproximación de los eigenvalores en el vector "lambdas".
%   A es una matriz.
%   k es el número máximo de iteraciones.
%   tol es la tolerancia máxima de error(para salir antes del ciclo).
Ai = A;

%Buscamos que ña diagonal inferior sea aproximadamente cero para que la
%aproximación de los eigenvalores nos quede en la diagonal de Ai. 
while norm(diag(Ai,-1))>tol  %aplicamos QR hasta que suceda. 
   [Q,R] = qr(Ai);
   Ai = R*Q;  
end

lambdas = diag(Ai);



end

