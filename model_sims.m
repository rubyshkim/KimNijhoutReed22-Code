% model_sims.m
% Run this script to compute model solutions

clear all;

p = parameters;
v = var_indices;

% transient solutions
init_y = [ones(1,8) 0]; 
ode_opt = {'RelTol',1e-8,'AbsTol',1e-8};
tspan = [0 24*50];
[~,Y] = model(tspan,init_y,p,v,ode_opt);

% simulations
init_y = Y(end,:);
tspan = [0 24*5];
[T,Y] = model(tspan,init_y,p,v,ode_opt);

% solutions
p1 = Y(:,v.p1);
p2 = Y(:,v.p2);
p3 = Y(:,v.p3);
p4 = Y(:,v.p4);
s = Y(:,v.s);
rev = Y(:,v.rev);
ror = Y(:,v.ror);
bc = Y(:,v.bc);