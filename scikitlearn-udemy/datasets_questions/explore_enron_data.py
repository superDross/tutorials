"""
    Starter code for exploring the Enron dataset (emails + finances);
    loads up the dataset (pickled dict of dicts).

    The dataset has the form:
    enron_data["LASTNAME FIRSTNAME MIDDLEINITIAL"] = { features_dict }

    {features_dict} is a dictionary of features associated with that person.
    You should explore features_dict as part of the mini-project,
    but here's an example to get you started:

    enron_data["SKILLING JEFFREY K"]["bonus"] = 5600000
"""
import sys
import pickle
import numpy as np
import operator
sys.path.append("../tools/")

enron_data = pickle.load(open("../final_project/final_project_dataset.pkl",
                              "r"))
poi_names = open("../final_project/poi_names.txt", 'r')
# poi_email_addresses = pickle.load(open("../final_project/poi_email_addressess

# for my own sanity
feature_names = sorted(enron_data.items()[0][1].keys())
print('FEATURE NAMES: \n{}'.format(feature_names))

n_samples = len(enron_data.keys())
print('Number of samples in the dataset: {}'.format(n_samples))

n_features = len(feature_names)
print('Number of features in the dataset: {}'.format(n_features))


def get_n_poi():
    ''' Get the total number of
        persons of interest from
        the dataset.
    '''
    n = 0
    for person in enron_data.keys():
        if enron_data[person]['poi'] == 1:
            n += 1
    return n


n_poi = get_n_poi()
print('Number of POI in dataset: {}'.format(n_poi))


def get_n_total_poi():
    ''' Returns the total number
        of POI for the ENRON scandal
    '''
    n = 0
    for line in poi_names:
        line = line.rstrip()
        if line.startswith('('):
            n += 1
    return n


n_poi_total = get_n_total_poi()
print('Total number of POI: {}'.format(n_poi_total))

pj_stock = enron_data['PRENTICE JAMES']['total_stock_value']
print('Total value of James Prentice: {}'.format(pj_stock))

cw_msgs = enron_data['COLWELL WESLEY']['from_this_person_to_poi']
print('Total number of email messages from Wesley Colwell: {}'.format(cw_msgs))

jks_stock = enron_data['SKILLING JEFFREY K']['exercised_stock_options']
print('Exercised stock options by Jeffrey K Skilling: {}'.format(jks_stock))

peeps = ['LAY KENNETH L', 'FASTOW ANDREW S', 'SKILLING JEFFREY K']
tp = [enron_data[x]['total_payments'] for x in peeps]
big_earner = peeps[np.argmax(tp)]
print('{} took home the most money (${})'.format(
    big_earner, tp[np.argmax(tp)]))


def get_all_feature(feature, op=False, POI=False):
    ''' Get all persons feature values that is
        or is not equal to NaN and return as a
        list.

    Args:
        feature: enron_data feature of interest
        op: operator to decide compare feature to NaN
        POI: if True, only POI in data set
    '''
    ops = {True: operator.eq, False: operator.ne}
    values = []
    for person in enron_data.keys():
        persons_feature = enron_data[person][feature]
        if POI and not enron_data[person]['poi']:
            continue
        if ops[op](persons_feature, 'NaN'):
            values.append(persons_feature)
    return values


msg = '{} employees have a quantified salary and {} have a known email address'
print(msg.format(len(get_all_feature('salary')),
                 len(get_all_feature('email_address'))))

msg = '{} ({}%) employees have no total payment information.'
payments_nans = float(len(get_all_feature('total_payments', op=True)))
print(msg.format(payments_nans, payments_nans / n_samples * 100))

msg = '{} ({}%) POI have no total payment information.'
payments_nans = float(len(get_all_feature('total_payments',
                                          op=True, POI=True)))
print(msg.format(payments_nans, payments_nans / n_samples * 100))


