function tot_costs = static_costs(end_time, gamma_tot)

% Get our nodes and adjacency matrix
nodes = make_nodes();
adj_mat = make_adj_mat();

% Run our simulation with the given end week and gamma
nodes = run_many(nodes, end_time, gamma_tot);

% Each (i,j) holds the cost per gamma from city i to city j
trans_costs = zeros(length(nodes));

% Run Dijkstra's alg to find the cost/gamma to each city for each starting city
for start = [1:length(nodes)]
  [trans_costs(:,start), paths] = dijkstra(adj_mat, start);
end

% Hold on to the costs to ship medicine to each city
costs = zeros(length(nodes),1);
gamma_sums = zeros(length(nodes),1);

% For each starting city, calculate the total costs to ship to each other city
for start = [1:length(nodes)]

  % Find all the medicine the other city needed in the whole simulation
  for n = [1:length(nodes)]
    gamma_sums(n) = sum(nodes(n).gammas);
  end

  % Multiply the total medicine by the transport costs
  costs(:,start) = trans_costs(:,start) .* gamma_sums;
end

% Return the total cost for each starting city
tot_costs = sum(costs);
