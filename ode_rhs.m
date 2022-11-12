function dy = ode_rhs(t,y,p,v)
%{
Equations to be used with an ODE solver
Inputs: 
   p  parameter structure as in parameters.m 
   v  variable structure containing indices of variables as in var_indices.m
%}

dy = zeros(9,1);

% parameters
r1 = p.val(p.r1);
r2 = p.val(p.r2);
r3 = p.val(p.r3);
r4 = p.val(p.r4);
rrev = p.val(p.rrev);
rror = p.val(p.rror);
d4 = p.val(p.d4); 
drev = p.val(p.drev);
dror = p.val(p.dror);
dbc = p.val(p.dbc);
alpha = p.val(p.alpha);
beta_bc = p.val(p.beta_bc);
beta = p.val(p.beta);
ds = p.val(p.ds);
x = p.val(p.x);
a = p.val(p.a);
daylength = p.val(p.daylength);
shift = p.val(p.shift);

% variables
p1 = y(v.p1);
p2 = y(v.p2);
p3 = y(v.p3);
p4 = y(v.p4);
s = y(v.s);
rev = y(v.rev);
ror = y(v.ror);
bc = y(v.bc);
ag = y(v.ag);

% equations
L = lightx(t,x,daylength,shift,a);
dy(v.p1) = r1*L*f(bc,p4) - r2*p1;
dy(v.p2) = r2*p1 - r3*p2;
dy(v.p3) = r3*p2 - r4*p3;
dy(v.p4) = r4*p3 - d4*p4;
dy(v.s) = beta + alpha*f(s,rev+ag)*ror - ds*s;
dy(v.rev) = rrev*f(bc,p4) - drev*rev;
dy(v.ror) = rror*f(bc,p4) - dror*ror;
dy(v.bc) = beta_bc*s - dbc*bc;
dy(v.ag) = -(log(2)/4.8)*ag;

end