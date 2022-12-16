%mosaico_colores.m
% mosaico de colores
% genero un mosaico de NxN de distintos colores
N=3;
ima=ones(N,N,3);
ima(:,:,1)=[1 0 0; 1 1 0; 0 0.5 1];
ima(:,:,2)=[0 1 0; 1 0 1;0 0.5 1];
ima(:,:,3)=[0 0 1; 0 1 1;0 0.5 1];
figure
image(ima) % grafica mosaico
