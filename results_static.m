% Our starting conditions
end_time = 52;
gamma_total = 0.001;

% Grab our nodes (for printing name later)
nodes = make_nodes();

% Calculate the total costs in the static simulation
total_costs = static_costs(end_time, gamma_total);

% Get the minimum cost, and the city associated with it
[min_cost, min_idx] = min( total_costs );

% Print results to screen
nodes(min_idx).name
min_cost  % in millions

file_name = 'results/static.txt';
fileID = fopen(file_name, 'w');

for n = [1:length(nodes)]
  fprintf(fileID,'%s\t%f\n', nodes(n).name, total_costs(n));
end

fprintf(fileID,'\nThe best starting city is %s with a cost of %f', nodes(min_idx).name, min_cost);
fclose(fileID);
