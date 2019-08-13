# Text Learning
Bag of Words; frequency count of words of interest that can be appliead to different texts.

Bag of words doesn't understand complex phrases, word order is not taken into account.

When printing a transformed bag of words (CountVectorizer()) we find a range of tuples e.g.
(1, 7)    6
which means first string in the list contains word number 7 6 times.

Stemmer; similar words bagged together e.g. unresponsive, response, respond in one stem.
TfIdf; term frequency inverse document frequency. 

Like a bag of words but weigted by how often  word occurs in the corpus/list-of-emails. It also upweights the rare words as they help distinguish emails better. Hence the use of the word inverse in its title.


