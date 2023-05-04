function [fX, fY, slope, intercept, Rsquared] = linearRegression(x,y)
%linearRegression Computes the linear regression of a data set
%   Compute the linear regression based on inputs:
if length(x) ~= length(y)
    error('x and y are not the same length')
end



n = length(x);
Quar1 = floor((n+1)/4);
Quar3 = floor((3*n +3)/4);
%Q1 = y(Quar1);
%Q3 = y(Quar3);
Q1 = median(y(y < median(y)));
Q3 = median(y(y > median(y)));
IQR = Q3-Q1;

[sortedY, sortOrder] = sort(y);
sortedX = x(sortOrder)


lowerBound = Q1 - (1.5 * IQR);
upperBound = Q3 + (1.5 * IQR);

fX=[];
fY=[];

for i = 1:length(sortedY)
    if sortedY(i) >= lowerBound && sortedY(i) <= upperBound
        % If the current data point is within the bounds, add it to the filtered data
        fY(end+1) = sortedY(i);
        fX(end+1) = sortedX(i);
    end
end



n = length(fX);
y_= mean(fY);
x_ = mean(fX);
m= ((n*sum(fY.*fX)) - (sum(fX).*sum(fY)))./ (((n*sum(fX.^2)) - (sum(fX)).^2));  
b= y_ - m*x_;

y= m*fX + b;

SStot= sum((fY - y_).^2);
SSres= sum((fY - b - m*fX).^2);
Rsquared = 1 - SSres/SStot;

%   Outputs:
%     1. fX: x-values with outliers removed
%     2. fY: y-values with outliers removed
%     3. slope: slope from the linear regression y=mx+b
slope = m;
%     4. intercept: intercept from the linear regression y=mx+b
intercept = b;
%     5. Rsquared: R^2, a.k.a. coefficient of determination

end
