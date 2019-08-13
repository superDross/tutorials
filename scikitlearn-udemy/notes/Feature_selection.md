# Feature Selection
Feature Selection; selecting a subset of relevant features for use in model cnstruction.

## Feature Reduction
Feature Reduction AKA Dimensionality Reduction

There are times when features will have to omitted when its:
- noisy
- causes overfitting
- strongly related (highly correlated) with an existing feature
- additional features slow down training/testing process

Fetures != Information
Features attempt to access/output information. You want the bare minimum number of features that it take to give you as much information as possible. If a feature isn't helping you get the information then get rid of it.

Univariate Feature Selection (UFS); treating each feature independently and asks how much power it gives you in classifying or regresssing.

SelectPercentile; a UFS that selects the X% of features that are most powerful.
SelectKBest; selects the K features that are most powerful.

High dimensionality data like text learning is a good candidate for feature reduction.

Feature reduction can also be performed in the TfidVectorizer() method max_df.

### Bias-Variance
High Bias; pays little attention to the training data and does the same thing over and over. High error on training set.
High Variance; pays too much attention to the data, not generalise well and overfits. High error on test set.

Too few fatures can result in a high bias scenario e.g. large SSE in a linear regression that uses very few features.

Too many features with extremely well tuned model parameters (well optimised) will likely result in a high variance scenario. e.g. reducing the SSE as much as possible in a linear regression that uses lots of features as input.

Few features and Large R²/Low SSE is desirable

An overfit (high variance) line will go point to point.

## Regularization
Regularization; automatic feature selection that best fits the data and prevents over-fitting; method for automatically penalising extra features.

### Lasso Regression
Normal linear regression wants to minimise the SSE while lasso regression minimises the SSE and number of features.

Regularization in lasso regression:
```
λ = penalty parameter
β = coeffcient of regression
λ|β| = describes how many features you are using

minimise SSE + λ|β|
```
The lower the SSE the higher the penalty (λ) will be. So lowering the SSE has to be better for the fit than the penalty taken for adding a new feature. A middle ground is found where the SSE and feature numbers are adequate for good predictions.

Lasso regression turns the coeffcient of a feature to zero if the feature is causing overfitting.
```
m = coeffcient of regression
x = features
Y = m₁x₁ + m₂x₂ + m₃x₃ + m₄x₄ + b
```



