options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4]);

[t,pop] = ode45(@(t,pop) spar(t,pop,params), [0 100], pop0, options);

P1 = plot(t,pop);
legend('S','P','A','R');

time = datestr(now, 31);

plot_name = strcat('figures/', time, '.pdf');
saveas(gcf, plot_name);

file_name = strcat('figures/', time, '.txt');
fileID = fopen(file_name, 'w');
fprintf(fileID, 'Initial S, P, A, R values\n');
fprintf(fileID, '%f\n', pop0);
fprintf(fileID, '\nParameters\n');
fprintf(fileID, 'beta\t%f\n',   params.beta);
fprintf(fileID, 'mu\t%f\n',     params.mu);
fprintf(fileID, 'gamma\t%f\n',  params.gamma);
fprintf(fileID, 'alpha\t%f\n',  params.alpha);
fprintf(fileID, 'b\t%f\n',      params.b);
fprintf(fileID, 'd\t%f\n',      params.d);
fclose(fileID);
