This is a matlab code that uses the root finding method of False position. It takes two inital points on your function that have different signs and makes a secant line 
between them. Where this line crosses the x intercept is the first guess. Then it recreates the guesses using the new one until it reaches the desired relative error.   

---

## Inputs: ##

func - the function being evaluated

xi - the lower guess

xu - the upper guess

es - the desired relative error (should default to 0.0001%)

maxit - the maximum number of iterations to use (should default to 200)

varargin - any additional parameters used by the function

## Outputs: ##

root - the estimated root location

fx - the function evaluated at the root location

ea - the approximate relative error (%)

iter - how many iterations were performed
