function [L, U, P] = luFactor(A)
% luFactor(A)
%	LU decomposition with pivoting
%error checking
if size(A,1) ~= size(A,2)
    error('given input is not a square matrix')
end 
% inputs:
P=eye(size(A,1),size(A,2));
L=eye(size(A,1),size(A,2));
U=A;
n=size(A,1);
for k = 1:n-1
  
    [~,v] = max(abs(U(k:n,k)));
    v = v + k - 1;
    
  
    U([k,v],k:n) = U([v,k],k:n);
    P([k,v],:) = P([v,k],:);
    L([k,v],1:k-1) = L([v,k],1:k-1);
    
    
    L(k+1:n,k) = U(k+1:n,k) / U(k,k);
    U(k+1:n,k:n) = U(k+1:n,k:n) - L(k+1:n,k) * U(k,k:n);
end
end
