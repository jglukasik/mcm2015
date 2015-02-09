% Do we want to enforce P to be nonnegative? What if we have more medicine than sick people?
options = odeset('RelTol', 1e-4, 'NonNegative', [1 2 3 4]);

[t,pop] = ode45(@(t,pop) spar(t,pop,params), [0 52], pop0, options);

P1 = plot(t,pop,t,sum(pop,2));
legend('S','P','A','R','D','total');

% Plot without S, total
%P1 = plot(t,pop(:,2:end));
%legend('P','A','R','D');

% Find the number of the last file
files = dir('figures/fig*');
m = regexp(files(end).name, ['\d+'], 'match'); 
file_num = sprintf('%04d', str2num(m{1}) + 1);


plot_name = strcat('figures/fig', file_num, '.pdf');
saveas(gcf, plot_name);

file_name = strcat('figures/fig', file_num, '.txt');
fileID = fopen(file_name, 'w');
fprintf(fileID, 'Initial S, P, A, R, D values\n');
fprintf(fileID, '%16f\n', pop0);
fprintf(fileID, '\nParameters\n');
fprintf(fileID, 'beta\t%16f\n',   params.beta);
fprintf(fileID, 'gamma\t%16f\n',  params.gamma);
fprintf(fileID, 'c\t%16f\n',      params.c);
fprintf(fileID, 'd\t%16f\n',      params.d);
fclose(fileID);
