%Calibración en intensidad
%curva de Plank normalizada al máximo
function intensidad=Planck(lambda,T)
	k=1.3e-23; %J/K
	c=3e8; % en m/s
	h=6.6e-34;%J*s
	lam2=lambda*1e-9; %m
	aux=h*c./(lam2*k*T);
	IntArbUnits=1./(lam2.^5.*(exp(aux)-1)); 
	Imax=max(IntArbUnits);
	intensidad=IntArbUnits/Imax;
end

