function dpop = spar(t,pop,params)

% Need vector here for ode solver... 
%   but confusing if pop is vector, params is struct
S = pop(1);
P = pop(2);
A = pop(3);
R = pop(4);

gamma = params.gamma;
alpha = params.alpha;
beta = params.beta;
mu = params.mu;
b = params.b;
d = params.d;


Sn = -beta*S*(P+A) - mu*S  + b;

Pn = beta*S*(P+A) - P*( gamma + alpha + mu);

An = alpha*P - d*A;

Rn = gamma*P - mu*R;

dpop = [Sn; Pn; An; Rn];

