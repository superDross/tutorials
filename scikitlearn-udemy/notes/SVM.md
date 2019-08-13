# Support Vector Machines (SVM)
SVM; find a line that best separates labels/categories.
Used for SUPERVISED CLASSIFICATION, work particularly well with numbers.

Margin; the distance between the line and the nearest point of the two labels/classes.
Best Line; a line that maximises the margin.

Hyperplane; a subspace of dimension n-1 e.g. a hyperplane in 4-spaces is a 3D volume.

SVM is going to find a line (AKA decision boundary) where the points from either class is as big as they can be. The decision boundary with the largest distance between all data points is determined as being the best line. This gives as much separation between the two classes as possible.

If you pick a line near a data point there is a small amount of noise then new data will more likely be misclassified (lacking robustness). Hence the need to find a line that maximises distance between two labels, to increase robustness.

If there is a few outliers that could compromise the margin, then that point will be ignored by the SVM algorithm.

## Kernel Trick
Kernel Trick; transform the data by increasing the dimensionality of a 2D decision space of features. This allows you to apply a linear ML technique to a non-linear plot. Watch [this](https://www.youtube.com/watch?v=3liCbRZPrZA) for an illustrative example.

SVMs can have non-linear decision boundaries by computing the third dimensional plane then plotting the z (z = x² + y²) against x. This alters the three dimensional plot into a two dimensional and thereby allow one to plot 

SVC Kernel options in the scikit learn docs...

## Parameters
Parameters; args parsed upon classifier initialisation and prior to model fitting.

These parameters can make a huge difference in the decision boundary that your algorithm arrives at.

Kernel; specify the kernel type to be used in the algorithm
C; lower float means straighter line/fit, the higher C value the more intricate the separation. 
Gamma; how far the influence a single point reaches e.g. a low value means far away points have an influence on computing the best margin while high values means only points close to the boundary have any influence on the best margin calculation.

## Overfitting
A low Gamma and a high C value could easily result in the model overfitting the data. The parameters (Kernel, C and Gamma) can be used to help reduce overfitting by "tuning" the parameters.
```
+ high dimensional spaces
+ domains with a clear margin of separation

- large data sets/features (slow)
- noisey/overlapping datasets 
```
