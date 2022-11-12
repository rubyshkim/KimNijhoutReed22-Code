function [T,Y] = model(tspan,init_y,p,v,options)
%{
Inputs: 
    t           time vector
    init_y      initial conditions
    p           parameter structure as in parameters.m
    v           variable indices as in var_indices.m
Output: 
    [T,Y]       output of ODE solver
%}

if nargin == 4
    options = {};
end

ode_opt = odeset(options{:});
[T,Y] = ode45(@(t,y)ode_rhs(t,y,p,v),tspan,init_y,ode_opt);

end