function [ sigmai, qi ] = metodo_potenciainversa_shiftR( A, q0, k, tol )
%Esta funci�n calcula el eigenvalor(sigmai) y el eigenvector (qi) de la matriz A dependiendo de q0.
%   A es una matriz en los reales. 
%   q0 es un vector inicial arbitrario con la dimensi�n igual a una columna
%   de la matriz A. 
%   k es el n�mero m�ximo de iteraciones.
%   tol es la tolerancia de error para salir del ciclo.

qi = q0;
i = 1;
e = 1;
rho = (q0'*A*q0)/(q0'*q0);  %se calcula el coef de rayleigh
x = size(A);


%se sale hasta que el m�ximo n�mero de iteraciones se cumple o la 
%tolerancia es menor la deseada. 
while i <= k && e > tol 
   I = eye(x(1));
   I = I.*rho;
   B = A - I;                 %se calcula la matriz con el shift de rayleigh
   temp = B\qi;               %se calcula la aproximaci�n del eigenvector de la inversa.
   sigmai = max(abs(temp));   %se calcula la aproximaci�n del eigenvalor.
   qi = temp/sigmai;          %se normaliza el eigenvector. 
   e = max(abs(A*qi - sigmai*qi)); %se calcula el error como la diferencia m�xima.
   i = i+1;
   rho = (qi'*A*qi)/(qi'*qi); %se calcula el coef de rayleigh
end

sigmai = 1/sigmai + rho; %pues es el eigenvalor de la inversa de la matriz.
end