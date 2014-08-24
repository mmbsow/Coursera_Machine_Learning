function idx = findClosestCentroids(X, centroids)
%FINDCLOSESTCENTROIDS computes the centroid memberships for every example
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

% Set K
K = size(centroids, 1);

% You need to return the following variables correctly.
idx = zeros(size(X,1), 1);

% ====================== YOUR CODE HERE ======================
% Instructions: Go over every example, find its closest centroid, and store
%               the index inside idx at the appropriate location.
%               Concretely, idx(i) should contain the index of the centroid
%               closest to example i. Hence, it should be a value in the 
%               range 1..K
%
% Note: You can use a for-loop over the examples to compute this.
%
%

n = size(X,1);
for i = 1:n
    distances = zeros(K,1);
    for j = 1:K
% Euclidean distance between 2 points P1 (x1,y1) and P2 (x2,y2) is:
% sqrt((x1-x2)^2 + (y1-y2)^2)
        points = [X(i, :); centroids(j, :)];
        distances(j,1) = pdist(points, 'euclidean');
    end
    [val, pos] = min(distances);
    idx(i,1) = pos;
end





% =============================================================

end

