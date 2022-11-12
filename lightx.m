function light = lightx(t,x,daylength,shift,a)
%{
Inputs: 
    t   zeitgeber time
    x	amplitude of light-dark cycle
    a	drd1 influence (a=1 in nominal model)
    daylength, shift     
%}

if mod(t+shift,24) < daylength
   light = 1.+a*x;
else
   light = 1.-x;
end

end