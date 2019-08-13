"""
    Starter code for the validation mini-project.
    The first step toward building your POI identifier!

    Start by loading/formatting the data

    After that, it's not our code anymore--it's yours!
"""
import pickle
import sys
sys.path.append("../tools/")
from feature_format import featureFormat, targetFeatureSplit
from sklearn.model_selection import train_test_split
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import accuracy_score

data_dict = pickle.load(
    open("../final_project/final_project_dataset.pkl", "r"))

# first element is our labels, any added elements are predictor
# features. Keep this the same for the mini-project, but you'll
# have a different feature list when you do the final project.
features_list = ["poi", "salary"]

data = featureFormat(data_dict, features_list)
labels, features = targetFeatureSplit(data)

# it's all yours from here forward!
# OVERFIT - TESTING AND TRAINING SAME DATA
clf = DecisionTreeClassifier()
clf.fit(features, labels)
pred = clf.predict(features)
overfit = accuracy_score(labels, pred)
print('overfit accuracy score: {}'.format(overfit))

# REAL
X_train, X_test, y_train, y_test = train_test_split(
    features, labels, random_state=42, test_size=0.3)
clf = DecisionTreeClassifier()
clf.fit(X_train, y_train)
pred = clf.predict(X_test)
score = accuracy_score(y_test, pred)

# EVALUATION METRICS PROJECT
print('Train_test_split score: {}'.format(score))
print('Number of POIs in test set'.format(sum(pred)))
print('Number of predictions: {}'.format(len(pred)))
# if all predictions are set to zero (non-POI) what is the accuracy score
all_poi_zero = [0 for _ in range(len(pred))]
print('Accuracy if all POI predictions = 0: {}'.format(
    accuracy_score(y_test, all_poi_zero)))
# Despite no POI being in our data set our accuracy score is very high. This is because our dataset is very imbalanced such that there are very few POI data points in there. In such a case precision and recall would be better suited.
true_pos = all_poi_zero.count(1)

# calculating precision and recall
predictions = [0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 1, 0, 1]
true_labels = [0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 0, 1, 0, 1, 1, 1, 0, 1, 0, 0]

tp = 0
fp = 0
fn = 0
tn = 0

for p, t in zip(predictions, true_labels):
    if p == 1 and t == 1:
        tp += 1
    if p == 0 and t == 0:
        tn += 1
    if p == 0 and t == 1:
        fn += 1
    if p == 1 and t == 0:
        fp += 1


print('\nTrue Positives {}\nTrue Negatives {}\nFalse Negatives {}\nFalse Positives {}'.format(tp, tn, fn, fp))

precision = round(float(tp) / (float(tp)+float(fp)), 3)
recall = round(float(tp) / (float(tp)+float(fn)), 3)
print('Precision: {}, Recall: {}'.format(precision, recall))
