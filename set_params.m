function [params] = set_params(beta, mu, gamma, alpha, b, d)

params = struct('beta',   beta,  ... % transmission rate
                'mu',     mu,    ... % natural death rate
                'gamma',  gamma, ... % recovery rate
                'c',      c,     ... % natural disease progression rate
                'b',      b,     ... % birth rate
                'd',      d);        % ebola death rate

