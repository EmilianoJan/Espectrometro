%Calibración en longitud de onda
%calibracion.m
%función que calibra
%datos de entrada: imagen violeta; imagen rojo (dual 658); ROI (región de
%interés)
%datos de salida: arreglos [Lsort,Isort, X] 
%calibración
%Lsort longitud de onda en nm de cada pixel vectorizado y ordenado
%Isort orden a utilizar para ordenar los espectros a lambda creciente.
%X matriz de coef polinomio de calibración 3 coeficientes por fila
%lambda= 
function [Lsort,Isort,X,L]=calibracion(ImV, ImR, roi) 
% 
	N=roi(2)-roi(1)+1; %M*N será el tamaño de la imagen recortada
	M=roi(4)-roi(3)+1;
	lambda=[405, 658, 810];             % longitudes de onda de patrones usados
	Av=double(ImV(roi(1):roi(2),roi(3):roi(4),:));      %recorto patron vio405c0on2dif_1 a roi
	Ar=double(ImR(roi(1):roi(2),roi(3):roi(4),:)); % idem para Dual658ConDif_1
	Bv=sum(Av,3);                                       %paso a grayscale para vio405c0on2dif_1
	Br=sum(Ar,3);                                       %paso a grayscale para Dual658ConDif_1
	[~,Ir]=max(Br,[],2);                             %busco coord del pico rojo  
	%(notación:  :variable sin nombre , no se guarda)
	[~,Iv]=max(Bv,[],2);                             %busco coord del pico violeta
	[~,Iv2]=max(Bv(:,Ir:640),[],2);         %busco coord del pico violeta 2do orden
	Iv2=Iv2+Ir-1;                       %refiero al mismo origen
	II=zeros(3);%reservo un espacio para la matriz 3x3
	X=zeros(N,3);% todas las filas, 3 parámetros para cada fila
	for i=1:N;
		II=[Iv(i)^2  Iv(i)  1; Ir(i)^2  Ir(i)  1; Iv2(i)^2  Iv2(i)  1];
		X(i,:)= linsolve(II, lambda'); %ajuste fila por fila
	end
	 
	L=zeros(N,M);                               %reservo espacio 
	for i=1:N;              % rg de filas calibrado
		for j=1:M; %todas las columnas
			L(i,j)=X(i,1)*j^2+ X(i,2)*j+ X(i,3);% lambda asignado a cada ij
		end
	end
	%
	%ya se generó matriz, se pasa ahora a vector
	La=zeros(N*M,1);%reservo espacio 
	k=0;
	for i=1:N;                   % rg de filas calibrado
		for j=1:M;                  %todas las columnas
			k=k+1;          %tamaño del vector La con todos los elementos de la matriz
			La(k)=L(i,j);    %patrón de lambda convertido a vector
		end
	end
	%
	% ordeno La
	%
	[Lsort,Isort]=sort(La);
	figure
	plot(L(10,:),'.')
	title('calibracion fila 10')
end
