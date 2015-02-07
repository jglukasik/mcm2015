function [params] = set_params(beta, gamma, c, d)

params = struct('beta',   beta,  ... % transmission rate
                'gamma',  gamma, ... % recovery rate
                'c',      c,     ... % natural disease progression rate
                'd',      d);        % ebola death rate

