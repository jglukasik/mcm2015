pop0 = [4000000 500 100 0 0] / 1000000;

params.beta = 10;
params.c = 1/3;
params.d = 1/2;

options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4 5]);

exponents = [0:7];
D_tot_ratios = [];
final_ts = [];

for cur_e = exponents
  cur_e
  params.exponent = cur_e;
  [t,pop] = ode45( @(t,pop) spar(t,pop,params), [0 52], pop0, options);
  D_tot_ratios = [D_tot_ratios pop(end,5)/sum(pop(end,:))];
  final_ts = [final_ts t(end)];
end

plot(exponents,D_tot_ratios);
plot_name = 'figures/exponent.pdf';
saveas(gcf, plot_name);

final_ts

