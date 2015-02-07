function dpop = spar(t,pop,params)

% Vector of population data
S = pop(1);
P = pop(2);
A = pop(3);
R = pop(4);

% A struct of parameter configurations
p = params;

% Step forward in our model

% The suspects will decrease as they become sick
Sn = -p.beta*S*(P+A);

% The primary stage sick people will grow as healthy get sick,
% and decrease as the sick are cured, or their disease advances
Pn = p.beta*S*(P+A) - p.gamma - p.c*(1 - p.gamma/P)*P;

% The advanced stage sick people will increase as the primary stage 
% people advance, and decreases as the sick die out
An = p.c*(1 - p.gamma/P)*P - p.d*A;

% The pool of people removed from spreading/catching disease increases
% as people are killed by the disease, and are cured of the disease.
Rn = p.d*A + p.gamma;

dpop = [Sn; Pn; An; Rn];

