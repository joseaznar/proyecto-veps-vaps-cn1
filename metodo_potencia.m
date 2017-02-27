function [ sigmai, qi ] = metodo_potencia( A, q0, k, tol )
%Esta funci�n calcula el eigenvalor(sigmai) y el eigenvector (qi) dominantes de la matriz A.
%   A es una matriz en los reales. 
%   q0 es un vector inicial arbitrario con la dimensi�n igual a una columna
%   de la matriz A. 
%   k es el n�mero m�ximo de iteraciones.
%   tol es la tolerancia de error para salir del ciclo.

qi = q0;
i = 1;
e = 1;

%se sale hasta que el m�ximo n�mero de iteraciones se cumple o la 
%tolerancia es menor la deseada. 
while i <= k && e > tol 
   temp = A*qi;               %se calcula la aproximaci�n del eigenvector.
   sigmai = max(abs(temp));   %se calcula la aproximaci�n del eigenvalor.
   qi = temp/sigmai;          %se normaliza el eigenvector. 
   e = max(abs(A*qi - sigmai*qi)); %se calcula el error como la diferencia m�xima.
   i = i+1;
end

end

