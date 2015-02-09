% Our starting conditions
end_time = 52;
gamma_total = 0.001;

% Grab our nodes (for printing name later)
nodes = make_nodes();

% Calculate the total costs in the static simulation
[week_costs, cities] = dynamic_costs(end_time, gamma_total);

file_name = 'results/dynamic.txt';
fileID = fopen(file_name, 'w');
fprintf(fileID,'The starting cities were:\n%s\n', mat2str(cities'));
fprintf(fileID,'Total cost of %f million\n', sum(week_costs));
fclose(fileID);
