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

%for i = 1 : size(X,1)
    %min = 99999;
   %for j = 1 :  K
       %val = (norm((X(i,1) - centroids(j,1)) + (X(i,2) - centroids(j,2))))^2;
       %fprintf('X :: %f , centroids :: %f , norm :: %d\n', X(i,:), centroids(j,:), norm(X(i,:) - centroids(j)));
       %if val <= min
           %idx(i) = j;
           %min = val;
           %fprintf('min :: %f , j :: %d , i :: %d\n', min, j, i);
       %end
   %end
%end


distance = zeros(size(X,1), K);
for i = 1 :  K
    %fprintf('bsxfun :: %f, i :: %d \n', bsxfun(@minus, X(i,:), centroids(i,:)), i);
    %distance(j) = sum(bsxfun(@minus, X, centroids(j,:)).^2);
    distance(:,i) = sum(bsxfun(@minus, X, centroids(i,:)).^2,2);
end
%fprintf('distance :: %f\n', distance);
[M, idx] = min(distance,[],2);



% =============================================================

end

