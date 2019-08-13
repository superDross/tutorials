# Decision Trees
Decision Trees; data is continuously split according to a certain parameter for each split. 
Node; are where the data splits.
Leaves; the final outcome of the split.

Used for SUPERVISED CLASSIFICATION.

They allow you to ask multiple questions, leading to splitting up the data into multiple decision boundaries.

## Parameters
min\_samples\_split; only split decision tree further if the split has the minimum number of samples.

## Entropy
Entropy; measure of impurity in a dataset which decide where to split the data.
Purity; a split which has only one label in it.

An entropy of 0 means the split is all of one class (pure), while an entropy of 1.0 means there is an even split between all available classes. Entropy is measured at each node.

The splits are determined by finding decision boundaries with data subsets that are as pure as possible. This is performed recursively until the decision tree has completed.

pi; fraction of slow/fast features over total number of features.
```
i = class labels
∑i = sum of all class labels

Entropy = ∑i-pi*log₂*pi
```

## Speed Example
If we look at one feature called speed with two labels; fast and slow. If we have 4 data points for this feature labelled; fast, fast, slow, slow, then what is the entropy?

```
grade   bumpiness   speed_limit   speed
---------------------------------------
steep   bumpy       yes           slow
steep   smooth      yes           slow
flat    smooth      no            fast
steep   bumpy       no            fast
```

The entropy of the speed feature above is 1.0; the maximally impure state. This can be manually calculated using the math or scipy module:
```
import math
import scipy

p_slow = 2/4 = 0.5
p_fast = 2/4 = 0.5

entropy = -p_slow*math.log(p_slow, 2) - p_fast*math.log(p_fast, 2)
entropy = scipy.stats.entropy([p_slow, p_fast], base=2)
# 1.0
```

## Information Gain
Information Gain; comparing parent and child node entropies acorss all features to determine where to split the data
```
information_gain = entropy(parent) - [weighted_average] * entropy(children)
```
The decision tree algorithm maximises information gain.

Information gain is used to choose which feature to split on.


## Speed Example
Using the speed feature as a starting node, we then branch out and calculate the entropy for each feature and follow the branch with the greatest purity.

```
information_gain = entropy(parent) - entropy(children)
s = slow
f = fast
e = entropy
ig = information gain

                                    1. SPEED
                                        |

                                      ssff
                                     (e=1.0)
                                        |
             ---------------------------------------------------------
            | 2. GRADE                  | 3. BUMPINESS                | 4. SPEED LIMIT
     ------- -------             ------- -------               ------- ------
    |               |           |               |             |              |
    | steep         | flat      | bumpy         | smooth      | yes          | no 
    |               |           |               |             |              |
                                 
   ssf              f          sf              sf            ss             ff
 (e=0.92)          (e=0)     (e=1.0)         (e=1.0)       (e=0)           (e=0)
           ig=0.31                     ig=0                        ig=1.0
```
1. SPEED
The parent node entropy is calculated (see last example)

2. GRADE
At the child node for grade, the entropy for each leave (steep and flat) is calculated:

```
entropy(parent) = 1.0

p_slow = 2/3
p_fast = 1/3
e_steep = -p_slow*math.log(P_slow, 2) - p_fast*math.log(p_fast, 2) = 0.92

p_slow = 1/1
p_fast = 1/1
e_flat = -p_slow*math.log(P_slow, 2) - p_fast*math.log(p_fast, 2) = 0

entropy(children) = ∑i+pi*e = (3/4 * 0.92) + (1/4 * 0) = 069
information_gain = entropy(parent) - entropy(children) = 1.0 - 0.69 = 0.31
```

3. BUMPINESS
Step 2 is repeated for bumpiness at which we arrive at an information gain of 0

4. SPEED LIMIT
Step 2 is repeated for speed limit at which we arrive at an information gain of 1.0

As we can see the best information gain score (one with the least impurities) is via the speed limit feature therefore the decision tree splits at the speed limit decision boundary. The decision tree would continue with the speed limit as the next parent node and children nodes for grade and bumpiness until splits/decision boundaries are established all the way down the tree.


+ easy to interpret
+ easy to use
+ ensemble methods can be used to build bigger classifiers (building a classifier out of a classifier)
- prone to over-fitting, almost always, and especially when using data with lots of features. So parameters tuning is important.
