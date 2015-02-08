function nodes = make_nodes()

% Liberia ----------------------------------------------------------------
liberia.pop0 = [4 0.006 0.002 0 0];
liberia.params = set_params(0.0630, 1/3, 1/2);
liberia.name = 'liberia';

% Monrovia
monrovia.pop0 = [0.970 0.0014 0.00045 0 0];
monrovia.params = set_params(0.0630, 1/3, 1/2);
monrovia.name = 'monrovia';

% Gbarnga
gbarnga.pop0 = [0.045 0.000000068 0.000000023 0 0];
gbarnga.params = set_params(0.0630, 1/3, 1/2);
gbarnga.name = 'gbarnga';


% Sierra Leone ----------------------------------------------------------
sierra_leone.pop0 = [6 0.007 0.003 0 0];
sierra_leone.params = set_params(0.0417, 1/3, 1/2);
sierra_leone.name = 'sierra_leone';

% Freetown
freetown.pop0 = [1 0.0012 0.000516 0 0];
freetown.params = set_params(0.0417, 1/3, 1/2);
freetown.name = 'freetown';

% Koidu
koidu.pop0 = [0.111 0.00013 0.000055 0 0];
koidu.params = set_params(0.0417, 1/3, 1/2);
koidu.name = 'koidu';


% Guinea ----------------------------------------------------------------
guinea.pop0 = [10 0.002 0.001 0 0];
guinea.params = set_params(0.0246, 1/3, 1/2);
guinea.name = 'guinea';

% Conarky
conarky.pop0 = [1.5 0.000319 0.000159 0 0];
conarky.params = set_params(0.0246, 1/3, 1/2);
conarky.name = 'conarky';

% Kankan
kankan.pop0 = [0.126 0.000025  0.000013 0 0];
kankan.params = set_params(0.0246, 1/3, 1/2);
kankan.name = 'kankan';


% -----------------------------------------------------------------------

% Use our cities as nodes
nodes = [conarky freetown monrovia kankan koidu gbarnga];
