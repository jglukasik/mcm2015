function G = get_adj_mat()

G = ...
[0.    , 3.40423, 9.12077, 7.87469, 5.74223, 12.0368; ...
3.40423, 0.     , 7.014  , 7.64346, 4.36769, 9.10792; ...
9.12077, 7.014  , 0.     , 9.15931, 4.70169, 2.53069; ...
7.87469, 7.64346, 9.15931, 0.     , 4.49615, 6.65431; ...
5.74223, 4.36769, 4.70169, 4.49615, 0.     , 5.89638; ...
12.0368, 9.10792, 2.53069, 6.65431, 5.89638, 0.    ];
  
%{
  Included cost:
    ground transportation cost per dose;
  
  Not included cost:
    capital investment (transportation system construction cost)
    time cost
    human resources cost
    
  Capital Cost:
    shipping from manufacturer to distribution Canter.
%}
