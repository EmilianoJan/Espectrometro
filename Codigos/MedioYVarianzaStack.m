%valor medio y std de stack
%lee stack de a uno y va calculando
%poner path donde está el archivo
A=double(ruidostack1);      %acá poner nombre de stack ya leido y pasa a doble precisión
tamanio=size(A);
n=tamanio(4);           %tamaño del stack
B=sum(A,3);         %suma a lo largo de color, pasa a grayscale
C=squeeze(B);       %saca la dimension redundante (igual a 1) 
S=sum(C,3)/n;      %matriz valores medio
Aux=sum(C.^2,3);         %intermedio para calcular varianza
S2=(Aux-n*S.^2)/(n-1);
u=reshape(S,1,[]);          %lo paso a vector
v=reshape(S2,1,[]);         
[medio,Isort]=sort(u);          %ordeno vector medio
varianza=v(Isort);              %ordeno consistentemente varianza

%suavizar vector
%promedia de a N el vector A y devuelve un vector de largo 
%size(A)/N
function v=suavizar(A,N);
B=reshape(A,N,[]);
v=mean(B);
end
