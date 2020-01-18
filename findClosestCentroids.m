function idx = findClosestCentroids(X, centroids)
%   idx = FINDCLOSESTCENTROIDS (X, centroids) returns the closest centroids
%   in idx for a dataset X where each row is a single example. idx = m x 1 
%   vector of centroid assignments (i.e. each entry in range [1..K])
%

K = size(centroids, 1);

idx = zeros(size(X,1), 1);

distance=zeros(size(X,1),K);
for i=1:K
    help=X-centroids(i,:);
    distance(:,i)=sum(help.^2,2);
end
[dummy idx]=min(distance,[],2);

end

