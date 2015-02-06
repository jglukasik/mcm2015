function dpop = spar(t,pop,params)

% Vector of population data
S = pop(1);
P = pop(2);
A = pop(3);
R = pop(4);

% A struct of parameter configurations
p = params;

% Step forward in our model
Sn = -p.beta*S*(P+A) - p.mu*S + p.b;
Pn = p.beta*S*(P+A) - P*( p.gamma + p.alpha + p.mu);
An = p.alpha*P - p.d*A;
Rn = p.gamma*P - p.mu*R;

dpop = [Sn; Pn; An; Rn];

