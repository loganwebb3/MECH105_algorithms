function [I] = Simpson(x, y)
% Numerical evaluation of integral by Simpson's 1/3 Rule
if length(x) ~= length(y)
   error('inputs are not the same length')
end
if isuniform(x) ~= 1
   error('input of x is not eavenly spaced')
end


if mod(length(x), 2) == 0
 warning('Trap rule used because of odd intervals in inputs')
 hT= x(end) - x(end-1);
 Trap = hT* (y(end)+y(end-1))/2; % trapiziodal rule for last interval
    x(end)=[];
    y(end)=[];
else
    Trap = 0 ;
 
end


n = length(x) - 1;
h = x(end) - x(1);
Odd = sum(y(2:2:end-1));
Even = sum(y(3:2:end-2));
I =  y(1) + 4*Odd + 2*Even + y(end);
I = I*h/(3*n) + Trap;





% Inputs
%   x = the vector of equally spaced independent variable
%   y = the vector of function values with respect to x
% Outputs:
%   I = the numerical integral calculated

end
