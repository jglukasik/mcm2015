pop0 = [4 0.006 0.002 0 0];
params = set_params(0.063, 0, 1/3, 1/2);

gammas = [0.0001 : 0.0001 : 0.005];
deaths = zeros(length(gammas), 1);
n = 1;

for g = gammas

  params.gamma = g;
  options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4]);
  [~,pop] = ode45(@(t,pop) spar(t,pop,params), [0 52], pop0, options);

  deaths(n) = pop(end,end);
  n = n + 1;

end

plot(gammas, deaths);

plot_name = 'figures/gamma_plot.pdf';
set(gcf, 'color', 'w');
saveas(gcf, plot_name);
