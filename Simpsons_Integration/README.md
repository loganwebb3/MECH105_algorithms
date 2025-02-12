This Matlab algorithm is for numerical integration using the Simpsons 1/3 rule. It also uses a trapezoidal rule for estimation of the integral for the last values if the number of intervals in input matrices is odd. Input arrays must be equally spaced. Useful to integrate tables or functions that are not easily integrated analytically. Will give a warning when the trapezoidal rule is used.

---
## Inputs: ##

x - array of x values

y - array of y values

## Output: ##

I - value of estimated integral.
