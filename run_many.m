% nodes - a cell array of nodes
% end_time - time to end simulation (in weeks)
function nodes = run_many(nodes, end_time, gamma_tot)

% Here is the structure of a node:
% node:
%   pop0   -> initial population distribution
%   params -> structure of node's parameters to use
%   pop    -> pop(t,:) = populations at start of week ending at t 
%                        (pop at t-1)
%   gammas -> gamma(t) = gamma needed at week ending at t (gamma needed at t-1)
%                        found after running sim from t-1 to t

options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4 5]);

% Save how many sick (but savable) people there are each week
P_tot = zeros(end_time+1, 1);

% Initialize the population matrices
for n = [1:length(nodes)]
  nodes(n).pop = zeros(end_time+1, 5);
  nodes(n).pop(1,:) = nodes(n).pop0;
  nodes(n).gammas = zeros(end_time+1, 1);

  P_tot(1) = P_tot(1) + nodes(n).pop(1,2);
end

% Set the inital gamma values
for n = [1:length(nodes)]
  nodes(n).gammas(1) = gamma_tot * nodes(n).pop0(2) / P_tot(1);
  nodes(n).params.gamma = nodes(n).gammas(1);
end

% DO TRANSPORTATION MATRIX STUFF

% We will step forward one week at a time
for t = [2:end_time+1]

  % See what happens this week for each node
  for n = [1:length(nodes)]

    % See how the disease spreads this week
    [~, cur_pop] = ode45( @(t,pop) spar(t,pop,nodes(n).params) ...
                        , [t-1 t]                              ...
                        , nodes(n).pop(t-1,:)                    ...
                        , options                              ...
                        );

    % Hold on to the final population distribution, use as initial
    % conditions for next week
    nodes(n).pop(t, :) = cur_pop(end,:);

    % Sum the number of sick people at the end of this week
    P_tot(t) = P_tot(t) + nodes(n).pop(t,2);

  end

  % For each node, find the proportion of gamma it needs this week
  for n = [1:length(nodes)]
    nodes(n).gammas(t) = gamma_tot * nodes(n).pop(t,2) / P_tot(t);
    nodes(n).params.gamma = nodes(n).gammas(t);
  end

end
