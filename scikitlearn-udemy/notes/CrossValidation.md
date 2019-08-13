# Cross Validation
Cross Validation; model evaluation technique for assessing how the results of a statistical analysis will generalise to an independent data set.

Train/Test/Split -----> PCA -----> SVM

```
# find the PCs from the training data
pca.fit(training_data)
# apply dimensionality reduction to the traianing data
pca.transform(training_data)
# use the  
SVC.fit(training_data)
#
pca.transform(test_data)
SVC.predict(test_data)
```
## K-Fold Cross Validation
Split the data into a number of subsets (k) and perform training and testing on each subset and average all holdout sets.

This technique allows you to use all your data for training and testing.

CAVEAT: it will split the  data into equal size partitions but won't perform any type of shuffling of the labels/features . This can be very problematic and should be kept in mind.

## Automating Parameter Tuning
GridSearchCV is a way of systematically working through multiple combinations of parameter tunes, cross-validating as it goes to determine which tune gives the best performance.
```python
from sklearn.model_selection import GridSearch

# pick a classifier and define parameters of said classifier you wish to test
svr = svm.SVC()
parameters = {'kernel':('linear', 'rbf'), 'C':[1, 10]}
# parse the classifier and the parameters to GridSearchCV to generate a grid of parameter combinations to try.
clf = GridSearchCV(svr, parameters)
# the fit function now tries all parameter combinations and returns a fitted classifier that is automatically tuned to the optimal parameters
clf.fit(iris.data, iris.target)
# print those paramters
print(clf.best_params_)
```
