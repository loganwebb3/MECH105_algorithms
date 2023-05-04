
function x = naiveGauss(A, b)
% Solves the system Ax = b using naive Gauss elimination
% A is an n x n matrix
% b is an n x 1 vector

% Size of the matrix
n = length(b);

% Elimination phase
for k = 1:n-1
    for i = k+1:n
        factor = A(i,k) / A(k,k);
        A(i,k+1:n) = A(i,k+1:n) - factor * A(k,k+1:n);
        b(i) = b(i) - factor * b(k);
    end
end

% Back substitution phase
x = zeros(n,1);
x(n) = b(n) / A(n,n);
for i = n-1:-1:1
    x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)) / A(i,i);
end
end