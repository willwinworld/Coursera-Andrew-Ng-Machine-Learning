function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.
% h_theta = X * theta - y; % h_theta(x) = theta_0 + theta_1 * x_1 + ... + theta_n * x_n
predictions = X * theta;
square_errors = (predictions - y).^2;
J = 1/(2*m)*sum(square_errors);
% 多变量线性回归的损失函数与单变量没有本质区别
% =======================================================================

end
