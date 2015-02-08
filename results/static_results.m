% Our starting conditions
end_time = 52;
gamma_total = 0.001;

% Grab our nodes (for printing name later)
nodes = make_nodes();

% Calculate the total costs in the static simulation
total_costs = static_costs(end_time, gamma_total);

% Get the minimum cost, and the city associated with it
[min_cost, city_idx] = min( total_costs );

% Print results to screen
nodes(city_idx).name
min_cost  % in millions
