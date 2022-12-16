%entrada: imagen de espectro medido, Lsort Isort roi
%los datos de calibracion estan guardados en calibracion.mat
%devuelve: EspSort que es el espectro vector ordenado por Isort (con el que se ordenó lambda (Lsort)
%lo grafica antes de cerrar
function EspSort=levantar_espectro(Imedido,Lsort, Isort,roi)
	N=roi(2)-roi(1)+1;
	M=roi(4)-roi(3)+1;
	Im=double(Imedido(roi(1):roi(2),roi(3):roi(4),:));      %recorto a roi
	ImGray=sum(Im,3);                                       %paso a grayscale
	%
	%paso a vector
	%
	Esp=zeros(N*M,1);%reservo espacio 
	k=0;
	for i=1:N;                   % rg de filas calibrado
		for j=1:M;                  %todas las columnas
			k=k+1;          %tamaño del vector La con todos los elementos de la matriz
			Esp(k)=ImGray(i,j);    %paso imagen a vector
		end
	end
	EspSort=Esp(Isort);
	figure
	plot(Lsort,EspSort,'.')
end
