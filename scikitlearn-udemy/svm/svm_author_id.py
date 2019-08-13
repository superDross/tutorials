#!/usr/bin/python

""" 
    This is the code to accompany the Lesson 2 (SVM) mini-project.

    Use a SVM to identify emails from the Enron corpus by their authors:    
    Sara has label 0
    Chris has label 1
"""
    
import sys
from time import time
sys.path.append("../tools/")
from email_preprocess import preprocess
from sklearn import svm
from sklearn.metrics import accuracy_score

### features_train and features_test are the features for the training
### and testing datasets, respectively
### labels_train and labels_test are the corresponding item labels
features_train, features_test, labels_train, labels_test = preprocess()

# reduce the training sets by 100-fold
# features_train = features_train[:len(features_train)/100]
# labels_train = labels_train[:len(labels_train)/100]

#########################################################
### your code goes here ###

# model initiation
# low gamma means only points close to line are considered and high C
# means more intricate separation (squiggly line)
clf = svm.SVC(kernel='rbf', C=10000, gamma=1)

# train
print('Training the model....')
t0 = time()
clf.fit(features_train, labels_train)
t1 = time()
print('Training time: {}s'.format(round(t1-t0, 1)))

# test
print('Testing/Fitting the model...')
t2 = time()
pred = clf.predict(features_test)
print('Fitting time: {}s'.format(round(t2-t1, 1)))

# accuracy
score = accuracy_score(labels_train, pred)
print('Accuracy Score: {}%'.format(round(score*100, 2)))
# 98.4% with a full training set using kernel='linear'
# 88.5% with a smaller one
# 61.6% with kernel='rbf'
# 99.54% with kernel='rbf', optimised C and gamma parameters and using full dataset
# speed-accuracy trade off is something to be mindful of

# predictions
test_data = [features_test[10], features_test[26], features_test[50]]
answer = clf.predict(test_data)
print('Reults of test features 10, 25 & 50 (Sara=0, Chris=1): {}'.format(answer))
# Chris, Sara, Chris

# how many Chris
print(len([x for x in pred if x == 1]))
# 869
#########################################################
