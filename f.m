function f = f(P,I)
%{
Protein sequestration
Inputs: 
    P  protein
    I  inhibitor
Output:
    f  available protein
%}

if P-I>0
    f = P-I;
else
    f = 0;
end
        
end