# Bayes Rule
Bayes Rule; incorporates evidence from a test into you prior probability to arrive at a posterior probability

Used for SUPERVISED CLASSIFICATION, works especially well with words.

prior probability (prp) * test evidence (te) = posterior probability (pp)

prp; the probability before you run a test
te; evidence from the test itself
pp; the probability that an event will happen after evidence info has been taken into account

## Cancer Example
#### Q
A specific cancer that occurs in 1% of the population and the test for this cancer has a 90% positive outcome if you have cancer (sensitivity) and 90% negative outcome if you don't have cancer (specificity).

- 1% population has a cancer
- Test has a 90% chance of being positive if you HAVE cancer
- Test has a 10% chance of being positive if you DON'T have cancer

Whats the probability that someone with a positive cancer test actually has the disease?

#### A
Divide the number of positively tested cancer patients with the total number of positively tested patients (regardless if they actually have cancer or not).

C = 1 * 0.9
NC = 10
Prob = C / (C+NC) # 8.25%

There is an 8.25% chance that someone with a positive test outcome actually has the disease.


## Bayes Rule Applied to Cancer
prior probability = population which have the cancer type
test evidence = the probability of positive test outcome in cancer/non-cancer patients (test sensitivity)
posterior probability = the revised probability of a positive test result for cancer/non-cancer patients after taking into consideration the test evidence

For cancer patients:
prior: P(C) = 0.01
evidence: P(Pos|C) = 0.9
posterior: P(C, Pos) = P(C) * P(Pos|C) = 0.009

For non-cancer patients:
prior: P(NC) = 0.99
evidence: P(Pos|NC) = 0.1
posterior: P(NC, Pos) = P(NC) * P(Pos|NC) = 0.099


### Normalisation
We normalise to keep the ratio of the posterior probabilities for both C and NC groups the same but make sure they add up to 1.

The 0.108 is the sum of all positive test outcomes for both cancer and non-cancer patients

normalizer: P(Pos) = P(C, Pos) + P(NC, Pos) = 0.108

Lets normalise the posterior values:

C posterior: P(C|Pos) =  P(C, Pos) / P(Pos) = 0.009 / 0.108 = 0.0833
NC posterior: P(NC|Pos) =  P(NC, Pos) / P(Pos) = 0.99 / 0.108 = 0.9167

We know normalisation has worked as C posterior + NC posterior = 1

We can conclude that there is a 8.33% chance that someone with a positive test outcome actually has cancer.

### Algorithm Summary

1- determine the prior probability
2- multiply the prior probability with the test evidence (for both cancer and non-cancer patients) to give the posterior probabilities for both branches
3- add the posterior probabilities together to calculate the normaliser
4- divide each branches posterior probability against the normaliser to get the normalised posterior probabilities

```
1-                      P(C)
                        |
               --------   --------
              |                    |
2-            | * P(Pos|C)         | * P(Pos|NC)
              |                    |
  
3-            P(Pos, C)     +       P(Pos, NC) -----> P(Pos)
            
              |                    |
4-            | / P(Pos)           | / P(Pos)
              |                    |

              P(C|Pos)             P(NC|Pos)
```


## Email Example
Looking at emails of two people and we found that they email about the following words at these given proportions: 

Chris = {'Love': 0.1, 'Deal': 0.8, 'Life': 0.1}
Sara = {'Love': 0.5, 'Deal': 0.2, 'Life': 0.3}

If an email containing the title 'Love Deal' is sent by an unknown sender (either Chris or Sara), can we calculate the Bayesian Probabilities to determine who was most likely to send the email?

Prior: P(Chris) = 0.5
Evidence: P(Chris|'Love Deal') = 0.1 * 0.8 = 0.08
Posterior: P('Love Deal', Chris) = P(Chris) * P(Chris|'Love Deal') = 0.04

Prior: P(Sara) = 0.5
Evidence: P(Sara|'Love Deal') = 0.5 * 0.2 = 0.1
Posterior: P('Love Deal', Sara) = P(Sara) * P(Sara|'Love Deal') = 0.05

Normalizer: P('Love Deal') = P('Love Deal', Chris) + P('Love Deal', Sara) = 0.09
P(Chris|'Love Deal') = P('Love Deal', Chris) / P('Love Deal') = 0.444
P(Sara|'Love Deal') = P('Love Deal', Sara) / P('Love Deal') = 0.556

## Naive
It is called naive as it simply multiplies the features/evidence of the target labels and simply gives a ratio of whether it is label A or label B. Its naive as, in the above email example, it ignores word order.


+ easy implement, deals with big feature spaces and very efficient
- doesn't handle phrases well (only single words)
