function [root, fx, ea, iter] = falsePosition(func, xl, xu, es, maxit, varargin)
%falsePosition finds the root of a function using false position method
if nargin < 3
    error('not enough inputs')
end
 if nargin < 4
    % if the user does not specify the desired relative error then it defaults to 0.0001%
    es = 0.0001;
else if nargin < 5
        % if the user does not specify the max number of iterations then it defaults to 200
        maxit = 200;
end

if sign(func(xu)) == sign(func(xl))
    %gives error is if the signs of the two guesses are the same.
        error('the two guesses are not opposite signs')
end
root= something;
fx=something;
ea=100; 
iter=0;
xr=xl;
while ea > es && iter < maxit  %will run it until the error percetnage is the given one or until it hits max iterations
    
    xrold=xr
    %formula for false position
    xr = xu - (func(xu) * (xl-xu))/( func(xl) - func(xu));
  
    iter = iter + 1; % tells the number of iterations
    
    if sign(func(xr)) == sign(func(xu)) 
        %checks which value should be replaced by xr for next iteration
        xu=xr;
    else 
        xl=xr;
    end
    
    if xr ~= 0 % can't divide by zero so if xr is zero won't calculate ea 
    ea = abs((xr-xrold)/xr) * 100
    else 
        ea =0;
   
     %error evaluation
    end
   
    
end
root=xr;
fx=func(xr, varagin{:});
 end