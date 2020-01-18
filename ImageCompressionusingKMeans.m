%% Image Compression using K-Means Clustering
%% Initialization
clear ; close all; clc

%% ================= Find Closest Centroids ====================
%  First I find the Closest Centroids and computeCentroids. 
%

fprintf('Finding closest centroids.\n\n');

load('ImageCompressionDataSet.mat');

K = 3; % 3 Centroids
initial_centroids = [3 3; 6 2; 8 5]; % Select an initial set of centroids

idx = findClosestCentroids(X, initial_centroids);

fprintf('Closest centroids for the first 3 examples: \n')
fprintf(' %d', idx(1:3));
fprintf('\n(the closest centroids should be 1, 3, 2 respectively)\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ===================== Compute Means =========================
%  Now lets implement the computeCentroids function.
%
fprintf('\nComputing centroids means.\n\n');

%  Compute means based on the closest centroids found in the previous part.
centroids = computeCentroids(X, idx, K);

fprintf('Centroids computed after initial finding of closest centroids: \n')
fprintf(' %f %f \n' , centroids');
fprintf('\n(the centroids should be\n');
fprintf('   [ 2.428301 3.157924 ]\n');
fprintf('   [ 5.813503 2.633656 ]\n');
fprintf('   [ 7.119387 3.616684 ]\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;


%% =================== K-Means Clustering ======================
%  Now lets run the K-Means algorithm on
%
fprintf('\nRunning K-Means clustering on example dataset.\n\n');

load('ImageCompressionDataSet.mat');

K = 3;
max_iters = 10;

% May also generate the intial centroids randomly(see kMeansInitCentroids).
initial_centroids = [3 3; 6 2; 8 5];

% Run K-Means algorithm. The 'true' at the end tells our function to plot
% the progress of K-Means
[centroids, idx] = runkMeans(X, initial_centroids, max_iters);%
fprintf('\nK-Means Done.\n\n');

fprintf('Program paused. Press enter to continue.\n');
pause;

%% ============= K-Means Clustering on Pixels ===============
%  Now I'll use K-Means to compress an image. To do this, first run K-Means on the colors 
%  of the pixels in the image and then I will map each pixel onto its closest centroid.
% 

fprintf('\nRunning K-Means clustering on pixels from an image.\n\n');

%  Load an image of a bird
A = double(imread('BirdImage.png')); % Can change the Image here

A = A / 255; % Normalisation

img_size = size(A);

% Reshape the image into an Nx3 matrix where N = number of pixels.
% Each row will contain the Red, Green and Blue pixel values
% This gives us our dataset matrix X that we will use K-Means on.
X = reshape(A, img_size(1) * img_size(2), 3);

K = 16;
max_iters = 10;

initial_centroids = kMeansInitCentroids(X, K);

[centroids, idx] = runkMeans(X, initial_centroids, max_iters);


fprintf('Program paused. Press enter to continue.\n');
pause;


%% ================= Image Compression ======================
%  Now I will use the clusters of K-Means to compress an image. 

fprintf('\nApplying K-Means to compress an image.\n\n');

% Find closest cluster members
%idx = findClosestCentroids(X, centroids);
X_recovered = centroids(idx,:);

% Reshape the recovered image into proper dimensions
X_recovered = reshape(X_recovered, img_size(1), img_size(2), 3);

% Display the original image 
subplot(1, 2, 1);
imagesc(A); 
title('Original');

% Display compressed image side by side
subplot(1, 2, 2);
imagesc(X_recovered)
title(sprintf('Compressed, with %d colors.-1', K));

fprintf('Program paused. Press enter to continue.\n');
pause;

