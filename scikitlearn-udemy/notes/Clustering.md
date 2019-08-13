# Clustering
Clustering; partitioning a set of data into meaning sub-classes called clusters.

Unsupervised Learning; Using a dataset without labels with a classifier. Check out patterns in the dataset to help predict future data points.

## K-Means
1- Assign: Cluster centers (centroids) are placed randomly and data points are assigned to a cluster that it is closest too. 
2- Optimise: The cluster centres are then moved to minimise the distance between all of its assigned data points and the center itself. 

The below link helps visualise k-means clustering.
http://www.naftaliharris.com/blog/visualizing-k-means-clustering/

+ 
- due to the random placement of centroids, the output for any fixed training set will NOT always be the same.
- if a centroid is placed between 2 data clusters, then it is possible that they will be assigned as one cluster.

## Sklearn
Many algorithms for clustering. n\_clusters is important and should be assigned. max\_iter is the number of times the assign and optimise are cycled through. n\_init the number of times the clusters are created and randomly placed, this helps reduce possible different assigned classifications upon intialisation.
