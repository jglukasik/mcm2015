% nodes - a cell array of nodes
% end_time - time to end simulation (in weeks)
function out = simulate(nodes, end_time)

options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4 5]);

% Initialize the population matrices
for n = [1:length(nodes)]
  nodes{n}.pop = zeros(end_time+1, 5)
  nodes{n}.pop(1,:) = nodes{n}.pop0;
end

% We will step forward one week at a time
for t = [1:end_time]

  % See what happens this week for each node
  for n = [1:length(nodes)]

    [~, cur_pop] = ode45( @(t,pop) spar(t,pop,params)
                        , [t-1 t]
                        , nodes{n}.pop(t,:)
                        , options
                        );

    nodes{n}.pop(t+1, :) = cur_pop(end,:);

  end

end

