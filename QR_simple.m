function [ lambdas ] = QR_simple( A, k, tol )
%Te regresa la aproximaci�n de los eigenvalores en el vector "lambdas".
%   A es una matriz.
%   k es el n�mero m�ximo de iteraciones.
%   tol es la tolerancia m�xima de error(para salir antes del ciclo).
Ai = A;

%Buscamos que �a diagonal inferior sea aproximadamente cero para que la
%aproximaci�n de los eigenvalores nos quede en la diagonal de Ai. 
while norm(diag(Ai,-1))>tol  %aplicamos QR hasta que suceda. 
   [Q,R] = qr(Ai);
   Ai = R*Q;  
end

lambdas = diag(Ai);



end

