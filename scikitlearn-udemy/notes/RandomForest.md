# Random Forest
## Resources
https://www.youtube.com/watch?v=loNcrMjYh64

SUPERVISED CLASSIFICATION or REGRESSION

Random Forest; based on bagging

Random feature matrix subsets are produced and applied to a decision tree algorithm, giving us different variations of the main classification. All the decision trees are then used to create a ranking of classifiers. If a new feature data point is added and asked to predict the label then all decision trees are queried and the most common label across all trees is predicted as being the features label.

## Example
1. A matrix is split into 3 data subsets. 
2. The subsets are used to create seperate decision tree classifiers.
3. A new feature matrix labels are predicted across all classifiers.
4. The most predcited label across classifiers is determined as being the label.

```
fA1; feature A from sample 1

1. 

df = [[fA1, fB1, fC1, fD1],       ----- s1 = [[fA2, fB2, fC2, fD2],
      [fA2, fB2, fC2, fD2],      |             [fA4, fB4, fC4, fD4]]
      [fA3, fB3, fC3, fD3],      |
      [fA4, fB4, fC4, fD4], ----- ----- s2 = [[fA1, fB1, fC1, fD1],
      [fA5, fB5, fC5, fD5],      |            [fA3, fB3, fC3, fD3]]
      [fA6, fB6, fC6, fD6]]      | 
                                  ----- s3 = [[fA5, fB5, fC5, fD5],
                                              [fA6, fB6, fC6, fD6]]
2. 

clf1 = s1 into decision tree
clf2 = s2 into decision tree
clf3 = s3 into decision tree

3.

X = [[fA, fB, fC, fD]]

pred1 = clf1.fit(X) = sample 5
pred2 = clf2.fit(X) = sample 3
pred3 = clf3.fit(X) = sample 5

4.

X label = sample 5
```













