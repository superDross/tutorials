# Feature Scaling
Feature Scaling; a method to standardize the range of features of data, usually between 0 and 1; data normalisation.

# Min/Max Scaling
Feature Scaling formula:
Xi = (X-Xmin)/(Xmax-Xmin)

Example: feature scaling weights. Scaling 140lb. 
weights = [115, 140, 175]

X = 140
Xmin = 115
Xmax = 175
Xi = (140 - 115)/(175 - 115) = 0.4167

+ reliable number
- outliers can mess up the feature scaling e.g. a very large outlier will mess up Xmax


SVM and K-Means Clusteing will be affected by feature scaling as both are very reliant on distance from data points to decision boundaries or clusters. Scaling the features would alter said distance.

Feature Scaling has no affect on Linear Regression or Decision Trees.
