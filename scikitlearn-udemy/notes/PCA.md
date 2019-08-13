# Principal Component Analysis (PCA)
http://setosa.io/ev/principal-component-analysis/ 
https://www.youtube.com/watch?v=nDuo5ECT1G4
https://www.youtube.com/watch?v=kw9R0nD69OU
start=55

This link seems to make the most sense
https://www.youtube.com/watch?v=spVqFnSvlIU

PCA; reduces a datasets dimension, by constructing a new coordinate system, to tease out variation

Variance (statistics); spread of a data distribution e.g. a large variance falls over a large numerical range of values.

Maximal Variance; the line which produces the maximum amount of variance/distance between data points and the line. This minimises the total information loss between the data and the line.

Orthogonal; of or involving right angles; perpendicular in 2D space.

Coordinate Centre; traditionally x=0, y=0

Principal Component; the line/direction that has the largest/maximum variance in the dataset (X')

Determining the maximum variance is desired as it contains the maximum amount of information in the original data. Any algorithm used to reduce the dimensionality must retain the maximal amount of information, hence why it is importnat to calculate.



1 - The X axis is moved into the middle of the data where you see the most variation relative to all data points. This becomes the new coordinate centre (x=0, y=0)
2 - A line is drawn through the data to represent maximal variance.
3 - An orthogonal line is then drawn

These lines are now treated as the new axes  (X' & Y')

## PCA Manually
1- Treat the X-axis like one dimension and try and find the start and end points
2- Do the same for the Y-axis
3- Determine the centre of the new coordinate system
4- Draw a line to represent the maximal variance AKA major axis (X')
5- Draw an orthogonal line, AKA minor axis, at the new coordinate centre (Y')


## Measureable Vs Latent Features
Measurable Features; features that can be directly measured e.g. square foot, number of rooms, school ranking, neighbourhood safety
Latent Features; cannot be directly observed/measured e.g. size (space perception), neighbourhood quality

Measureable features can be used to probe Latent features e.g. school ranking and neighbourhood safety are measureable features/variables associatd with the quality of the neighbourhood.

Measurable                  Latent 
----------                  ------
square feet --------
                    |
                    |----> size (space perception)
                    |
no. of rooms -------


school ranking ----- 
                    |
                    |----> n.hood quality
                    |
n.hood  safety -----


We want to condense our 4 (measurable) features into 2 (latent) features so that we can really get the information we want. Feature selection algorithms like SelectKBest to reduce dimensionality would be the best tool to use. 

## Dimensionality Reduction and Information Loss
PCA is mostly used for dimensionality reduction.

Many features are available to us but we think only a subset are driving the phenomenon. We reduce the dimensionality of the feature set to produce a composite feature (principal component) to directly probe the underlying phenomenon.

When the line is drawn through the data the points are moved towards the line, thereby reducing dimensionality. The distance between the point and the line represents the data loss for that point. Do this for all points and summarise the distances gives you the total information loss.

## PCA for Feature Transformation
PCA can be used to reduce the dimensionality of features which can thereafter be used to input into algorithms they would not have original been able to processed through e.e.g regression.

                PCA
square feet --------
                    |                               Regression
                    |----> size (space perception) -------
                    |                                     |
no. of rooms -------                                      |
                                                          |
                                                          |----> Prediction Model
                PCA                                       |
school ranking -----                                      |
                    |                                     |
                    |----> n.hood quality ---------------- 
                    |
n.hood  safety -----

The problem with the above example is that the features to be reduced must be manually picked. This doesn't scale well.

What PCA does is mix all the features together and outputs a first (PC1) and second(PC2) principle component. This way you know that two things that seem to drive the house prices in general. It won't however tell you what exactly it is these things are though.

## Selecting PC number
Train on different number of PCs and see how accuracy responds - cut off when it becomes apparent that adding more PCs causes the accuracy to platue.

NEVER DO FEATURE SELECTION before PCA.

## Summary
- Prinicipal Components (PCs) are directions/lines in the data that maximise variance (minimise information loss) when you compress them.
- PCA is a systematic to transform input features into PC. 
- These PCs can used as new features in regression or classification tasks.
- PCs are ranked by most variance.
- PCs are all perependicular to one another; PC2 is therefore mathematically guarenteed to not overlap at all with PC1. They can therefore be treated as independent features.
- There is a maximum number of PCs; equal to the number of input features in your dataset.

## When to Use PCA
- When you want access to latent features that you think are driving the pattern in the data
- Visualise high-dimensioal data
- Reduce noise
- Allow you to use regression or classifiers on high dimensional data.
