# Used K-Means Clustering for Image Compression. The code is in Matlab.
Note: All the files are well documented and commented wherever I felt necessary

Run the file named ImageCompressionusingKMeans.m which does the following:
1. I've found the Closest Centroid for every Training example.
2. Computes for each centroid, the mean of the points that were assigned to it.
3. Runs the KMeans Clustering Algo on dataset named ImageCompressionDataSet.mat
4. Runs the KMeans Clustering Algo on Image BirdImage.png
5. To compress the BirdImage.png assign each pixel to the centroid assigned to it
6. Finally, we get a compressed image, placed side-by-side to the Orignal image
