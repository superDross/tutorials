#!/usr/bin/python

"""
    This is the code to accompany the Lesson 1 (Naive Bayes) mini-project.

    Use a Naive Bayes Classifier to identify emails by their authors

    authors and labels:
    Sara has label 0
    Chris has label 1
"""

import sys
from time import time
sys.path.append("../tools/")
from email_preprocess import preprocess
from sklearn.naive_bayes import GaussianNB
from sklearn.metrics import accuracy_score

# features_train and features_test are the features for the training
# and testing datasets, respectively
# labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

t0 = time()
model = GaussianNB()
model.fit(features_train, labels_train)

print('Model Training Time: {}s'.format(round(time() - t0, 3)))
label_model = model.predict(features_test)
acc = accuracy_score(labels_test, label_model)
print('Accuracy Score: {}%'.format(round(acc*100, 1)))
# 92%

#########################################################
### your code goes here ###


#########################################################
