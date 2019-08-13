# Evaluation Metrics

## Accuracy Score
We have been using accuracy score to determine accuracy.

Accuracy = no. data points in a class labelled correctly / all items in a class

Some Weaknesses of accuracy score metric:
- Not good for skewed data points; where a small subset fall into a different class. This would result in an inaccurate score as there are so few data points.
- Doesn't allow for a default class assignment on data points that aren't clearly one class or another e.g. defaulting to innocent in a criminal judgement algorithm.

## Confusion Matrix
All diaganol numbers are those that have been predicted correctly.

Recall; number of true labels that have been correctly predicted divided by the total amount of true labels.
Precision; number of true labels that have been correctly predicted divided by the total amount of predictions made for that value.

Recall AKA Sensitivity and Precision AKA Positive Precsion Rate

True Positives (TP) = number of true labels that have been correctly predicted
False Negatives (FN) = number of incorrectly predicted labels being assigned to the true label
False Positives (FP) = number of incorrectly predicted labels being assigned to a different label

Precision = TP/(TP+FP)
Recall = TP/(TP+FN)


f1\_score; measure of a tests accuracy by determining a  weighted average of the precision and recall. Where 1 is the most accurate.
