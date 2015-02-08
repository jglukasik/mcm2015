% Grab our city nodes, set an end time
nodes = make_nodes();
end_time = 52;

% Set our range of gammas
gammas = [0.0001 : 0.0002 : 0.005];
deaths = zeros(length(gammas), length(nodes));

% Test out a range of gammas
for idx = 1:length(gammas)
  [idx, length(gammas)]
  nodes = run_many( nodes, end_time, gammas(idx) );

  % See how many people died in each city for each gamma
  for n = 1:length(nodes)
    deaths(idx,n) = nodes(n).pop(end,end);
  end
  
end

plot(gammas, deaths);

% Make cell array of node names for legend
legend_titles = {};
for n = 1:length(nodes)
  legend_titles{n} = nodes(n).name;
end
legend(legend_titles);

% Save it, white background for paper
plot_name = 'figures/cities_gamma_plot.pdf';
set(gcf, 'color', 'w');
saveas(gcf, plot_name);
