import numpy as np
import pickle
import sys
import matplotlib.pyplot
sys.path.append("../tools/")
from feature_format import featureFormat, targetFeatureSplit
from sklearn import linear_model
import outlier_cleaner

# read in data dictionary, convert to numpy array
data_dict = pickle.load(
    open("../final_project/final_project_dataset.pkl", "r"))
features = ["salary", "bonus"]
data = featureFormat(data_dict, features)


def get_outlier():
    # the outlier has a massive bonus and salary
    # find the index of the data point with the largest salary and bonus
    b = np.array([x[1] + x[0] for x in data])
    ind = np.argsort(b)[-1]
    s, b = data[ind]

    # find the person with the matching salary and bonus value
    for person in data_dict.keys():
        if s == data_dict[person]['salary'] \
                and b == data_dict[person]['bonus']:
            outlier = person
    return outlier


outlier = get_outlier()
# reload the dataset and remove the outlier
data_dict = pickle.load(
    open("../final_project/final_project_dataset.pkl", "r"))
data_dict.pop(outlier, 0)
features = ["salary", "bonus"]
data = featureFormat(data_dict, features)

b = np.array([x[1] for x in data])
ind = np.argsort(b)[-1]
s, b = data[ind]

# find the person with the matching salary and bonus value
for person in data_dict.keys():
    if s == data_dict[person]['salary']:
        print(person)

# 
# for point in data:
#     salary = point[0]
#     bonus = point[1]
#     matplotlib.pyplot.scatter(salary, bonus)
# 
# matplotlib.pyplot.xlabel("salary")
# matplotlib.pyplot.ylabel("bonus")
# matplotlib.pyplot.show()
# 
