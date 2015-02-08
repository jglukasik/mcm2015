params = set_params(0,0,0,0.5);
pop0 = [4 0.000001 0 0 0];

ideal_ratio = 8.7/3.7;
ideal_inf = 0.0087;

close_ratio = Inf;
close_inf = Inf;
close_b = 0;
close_c = 0;

for b_iter = [0.068:0.0005:0.071], 

  for c_iter = [0.3:0.05:0.5],
    params.beta = b_iter;
    params.c = c_iter;
    run_ode;
    i_d_ratio = sum(pop(end,[2 3 5])) / pop(end,end);
    
    if (abs(i_d_ratio - ideal_ratio) < abs(close_ratio - ideal_ratio) ...
     && abs( sum(pop(end,[2 3 5])) - ideal_inf) < abs( close_inf - ideal_inf )) 

      close_ratio = i_d_ratio;
      close_inf = sum(pop(end,[2 3 5]));
      close_dead = pop(end,end);
      close_b = params.beta;
      close_c = params.c;
    end

  end
end

[close_b, close_c]

[close_inf, close_dead]

close_ratio

