function J = computeCost(X, y, theta)
%COMPUTECOST Compute cost for linear regression
%   J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

h_theta = X*theta - y; % h_theta(x) = theta_0 + theta_1 * x
J = (1 / (2 * m)) * sum(h_theta .* h_theta); 
% h_theta是行向量，所以sum就相当于将所有元素加起来
% .* 是对应元素相乘，例：[1,2,3,4] .* [1,2,3,4] = [1,4,9,16] 
% =========================================================================

end
