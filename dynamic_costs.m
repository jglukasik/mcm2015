function [week_costs, cities] = dynamic_costs(end_time, gamma_tot)

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
week_gammas = zeros(length(nodes),1);

% Hold onto the cost each week and the city we start at
week_costs = zeros(end_time+1,1);
cities = zeros(end_time+1,1);

% For each starting city, calculate the total costs to ship to each other city
for week = [1:end_time+1]

  for start = [1:length(nodes)]
  
    % Find all the medicine the other cities needed this week
    for n = [1:length(nodes)]
      week_gammas(n) = nodes(n).gammas(week);
    end
  
    % Multiply the total medicine by the transport costs
    costs(start) = sum(trans_costs(:,start) .* week_gammas);
  end

  [min_cost, city] = min(costs);

  week_costs(week) = min_cost;
  cities(week) = city;

end
