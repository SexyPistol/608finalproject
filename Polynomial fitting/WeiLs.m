function[th, err, yi]  =WeiLs(x, y, N, xi, r)
% Weighted Least Squares 
% x, y are the data set
% N is the coefficient of the fitting polynomial
% r is the inverse of the weigthed coefficient 
M = length(x);
x = x(:);
y = y(:);
%% determine the format
if nargin == 4
    if length(xi) == M
        r = xi;
        xi = x;
    else r = 1;
    end
elseif nargin == 3
    xi = x;
    r = 1;
end
%% get the matrix of coefficient
A(:,N+1) = ones(M,1);
for n = N:-1:1
    A(:, n) = A(:,n+1).*x;
end
if length(r) == M
    for m = 1:M
        A(m,:) = A(m,:)/r(m);
        y(m) = y(m)/r(m);
    end
end
%% computing the fitting coefficient
th = (A\y)';
ye = polyval(th, x);
err  = norm(y-ye)/norm(y);
yi = polyval(th, xi);
