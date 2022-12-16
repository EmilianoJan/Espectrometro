%suavizar vector
%promedia de a N el vector A y devuelve un vector de largo 
%size(A)/N
function v=suavizar(A,N);
	B=reshape(A,N,[]);
	v=mean(B);
end
