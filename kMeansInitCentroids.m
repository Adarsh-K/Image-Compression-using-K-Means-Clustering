function centroids = kMeansInitCentroids(X, K)
%   centroids = KMEANSINITCENTROIDS(X, K) returns K initial centroids to be
%   used with the K-Means on the dataset X
%

centroids = zeros(K, size(X, 2));

X_unique=unique(X,'rows');
centroids=X_unique(randperm(size(X_unique,1),K),:);

end

