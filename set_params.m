function [params] = set_params(beta, c, d)

params = struct('beta',   beta,  ... % transmission rate
                'c',      c,     ... % natural disease progression rate
                'd',      d);        % ebola death rate

