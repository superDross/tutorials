# Regression
CONTINUOUS SUPERVISED

## Continuous Vs. Discrete Output
Discrete Values; individually seperate and distinct; categories/classifications e.g. slow/fast, phone numbers
Continuous Values; not restricted to defined seperate values but rather something that is ordered; numeric e.g. weight, income

Go with a Discrete Classifier if the output is NOT ORDERED.
Go with a Continuous Classifier if the output is ORDERED.

## Regression Calculation
Slope; how close the line is to the Y-axis; how steep the line is.
Intercept/Coefficient; the value in which the line crosses the Y-axis; the Y value when X = 0.
```
Y; target variable
m; slope
X; input/feature value
b; intercept

Y = mX + b
```

## Linear Regression Errors
### Sum of the Squared Errors
Associated Errors; actual net worth - predicted net worth (from our regression model)

A good fit will minimise the sum of the squared of all data points on the regression line; minimising the sum of squared errors (SSE).
```
t; all training points
actual; training points
predicted; predictions from regression

SSE = ∑t(actual-predicted)²
```
It is all about finding the slope and intercept values that minimise the SSE. 
Ordinary Least Squares (OLS) and Gradient Descent are algorithms for minimising the above errors. Sklearn uses the former.

The problem with SSE is that the more data points a regression model has, the larger the SSE is and will look like a poor fit despite that not being the case.

### R²
R²; a statistical measure of how close the data is to the fitted regression, the higher the value the better the model fits your data. Numbers between 0-1.

If R² in training data is lower than your R² in your testing data, the  there is over-fitting.

If R² is close to 1 then your line does a good job of describing the relationship between your features/input (x) and your target/output (y).

### Visualise
Always look at your regression with a scatterplot! This way you can see whether your data is a good candidate for regression modelling and whether your quanitified results are similar to what you visualise on a plot.


## Classification Vs Regression

   property         |   classification     |   regression
--------------------------------------------------------------	
   output type      |   discrete (labels)  |   continuous (numbers)
                    |                      |
   trying to find?  |   decision boundary  |   best fit line
                    |                      |
   evaulation       |   accuracy           |   R²/SSE


## Multivariate Regression
Multivariate Regression; using multiple variables to predict the target.


