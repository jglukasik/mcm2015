function dpop = spar(t,pop,params)

% Vector of population data
S = pop(1);
P = pop(2);
A = pop(3);
R = pop(4);
D = pop(5);

% A struct of parameter configurations
p = params;

% Seasonal forcing parameter
sf = (1 + 1*cos(2*pi*t));

% Gamma will be dependent on P. Let's assume its linear for now
gamma = min(p.gamma, P);

% The suspects will decrease as they become sick
Sn = -p.beta*S*(P+A)*sf;

% The primary stage sick people will grow as healthy get sick,
% and decrease as the sick are cured, or their disease advances
Pn = p.beta*S*(P+A)*sf - gamma - p.c*(P - gamma);

% The advanced stage sick people will increase as the primary stage 
% people advance, and decreases as the sick die out
An = p.c*(P - gamma) - p.d*A;

% The pool of people removed from spreading/catching disease increases
% as are cured of the disease.
Rn = gamma;

% The pool of people that died
Dn = p.d*A;

dpop = [Sn; Pn; An; Rn; Dn];

