import numpy as np


def outlierCleaner(predictions, ages, net_worths):
    """
        Clean away the 10% of points that have the largest
        residual errors (difference between the prediction
        and the actual net worth).

        Return a list of tuples named cleaned_data where 
        each tuple is of the form (age, net_worth, error).

    Args:
        predictions: predicted net worth
        age: age training data
        net_worths: net worth training data
    """
    cleaned_data = []
    predictions = predictions.flatten()
    net_worths = net_worths.flatten()
    SSE = (predictions - net_worths) ** 2
    # get the indexes of the top ten most errored data points
    ind = np.argsort(SSE)[::-1]
    top_ind = ind[:len(net_worths)/10]
    # remove the indexes from the arays and return as a mixed tuple
    new_net_worths = np.delete(net_worths, top_ind)
    new_ages = np.delete(ages, top_ind)
    new_SSE = np.delete(SSE, top_ind)
    data = [(x, y, z) for x, y, z in zip(new_ages, new_net_worths, new_SSE)]
    return data


    
    return cleaned_data

