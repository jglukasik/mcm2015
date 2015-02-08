function [dists,prev] = dijkstra(graph, start)

% Assume square matrix graph
n = length(graph);

% Initialize list of:
dists = Inf(n,1);  % distances to each node
prev = zeros(n,1); % prev(ind) = node you visit before node ind

% Our starting node is 0 away, we start here
dists(start) = 0;

% List of unvisted nodes
unvisited = [1:n];

% Look at each of our unvisited nodes
while (length(unvisited) ~= 0)

  % u is the closest node that we have not yet visted
  [~, ind] = min(dists(unvisited));
  u = unvisited(ind);

  % we visit this node, pull it from our unvisited list
  unvisited(ind) = [];

  % Now, look at every neighbor of the node we are visiting
  % In our model, all nodes are connected to all other nodes
  for v = [1:n]

    % Skip if we are looking at this same node
    if (v == u)
      continue;
    end

    % Compute the path cost to get to this neighboring node
    path_cost = dists(u) + graph(u,v);

    % If this path is less expensive than before
    if (path_cost < dists(v))
      dists(v) = path_cost;
      prev(v) = u;
    end

  end
end

