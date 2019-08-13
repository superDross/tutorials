# AdaBoost
## Resources
https://www.youtube.com/watch?v=GM3CDQfQ4sw

## Define
SUPERVISED CLASSIFICATION

Bootstrap Aggregating (Bagging); the combination of learning models increases the classification accuracy, reduce variance and decrease overfitting.

Boosting; an ensemble technique that attempts to create a strong classifier from a number of weak classifiers (usually decision trees). Primarily used to reduce variance and bias. It is a variation on bagging.

Weak Classifier; a classifier which only label data better than random guessing.

This is done by building a model from training data, then creating a second model that attempts to correct the errors from the first model. Models are added until the training set is predicted perfectly or a maximum number of models are added.

AdaBoost; boosting with decision trees as the weak classifiers/learners.

Some of the training data is used to train the model then all of the training data is used to test the model. This generates an  error batch (labels not correctly predicted). This process is performed again but this time it is weighted such that those data points that were incorrectly predicted are more likely to be used to train the next model. The ensemble of both models output is combined. Those incorrectly predicted are added to the error batch again to help train the next model. This is done continuously until the maximum number of classifiers have been built for the ensemble.

## Parameters
base\_estimator: estimator type (an sklearn object) e.g. DecisionTreeClassifier
n\_estimators: number of estimators to ensemble

```
+
- only two-class classification problems are supported e.g. features with only two labels.
```


