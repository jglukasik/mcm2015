% nodes - a cell array of nodes
% end_time - time to end simulation (in weeks)
function out = simulate(nodes, end_time, gamma_tot)

% Here is the structure of a node:
% node:
%   pop0   -> initial population distribution
%   params -> structure of node's parameters to use
%   pop    -> pop(t,:) = populations at start of week t
%   gammas -> gamma(t) = gamma needed at week t

options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4 5]);

P_init = 0;   % Hold total for inital P
P_tot = zeros(end_time+1, 1);  % Hold subsequent P distributions

% Initialize the population matrices
for n = [1:length(nodes)]
  nodes{n}.pop = zeros(end_time+1, 5);
  nodes{n}.pop(1,:) = nodes{n}.pop0;

  nodes{n}.gammas = zeros(end_time+1, 1);
  P_init = P_init + nodes{n}.pop0(2);
end

% Set the inital gamma values
for n = [1:length(nodes)]
  nodes{n}.params.gamma = gamma_tot * nodes{n}.pop0(2) / P_init;
end

% DO TRANSPORTATION MATRIX STUFF

% We will step forward one week at a time
for t = [1:end_time]

  % See what happens this week for each node
  for n = [1:length(nodes)]

    % Sum the number of sick people at the start of this week
    P_tot(t) = P_tot(t) + nodes{n}.pop(t,2);

    % See how the disease spreads this week
    [~, cur_pop] = ode45( @(t,pop) spar(t,pop,nodes{n}.params) ...
                        , [t-1 t]                              ...
                        , nodes{n}.pop(t,:)                    ...
                        , options                              ...
                        );

    % Hold on to the final population distribution, use as initial
    % conditions for next week
    nodes{n}.pop(t+1, :) = cur_pop(end,:);

  end

  % For each node, find the proportion of gamma it needs this week
  for n = [1:length(nodes)]
    nodes{n}.gamma(t) = gamma_tot * nodes{n}.pop(t,2) / P_tot(t);
    nodes{n}.params.gamma = nodes{n}.gamma(t);
  end

end

