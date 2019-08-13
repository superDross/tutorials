# K Nearest Neighbour (kNN)
## Resources
https://www.youtube.com/watch?v=UqYde-LULfs
https://machinelearningmastery.com/boosting-and-adaboost-for-machine-learning/

## Defined
SUPERVISED CLASSIFICATION

kNN; predict the label of a data point based upon the given number of closest neighbours (e.g. 3 closest neighbours; k=3)

## Example
Lets say kNN has been trained to recognise 2 labels (A & O) and asked to predict a new data points label (C) based on the closest 3 neighbours labels (k=3 or n_neighbours=3). If the 3 closest neighbours are 2x O and 1x A then data point C will be assigned the label O.

When k=1 a very different way a estimating the nearest label is calculated. I don't fully understand yet.

Caveats:
- an odd k number must be used for a 2 class problem
- k must not be a multiple of a number of classes/labels
- slow: computationally demanding to search for the nearest neighbour for each sample.

## Parameters
n_neghbours: number of neighbours to use as means to determine label
weights: uniform (all k neighbours are weighted equally), distace (distance of C from A/O is taken into consideration as well as number of A/O nearest to C), User-Defined function


