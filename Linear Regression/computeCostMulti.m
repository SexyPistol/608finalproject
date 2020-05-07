function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute error for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples


J = 0;


hx = X * theta;
J = 1 / (2 * m) * sum((hx - y).^ 2);



end
