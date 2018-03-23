function [J, grad] = costFunctionReg(theta, X, y, lambda)
%COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
%   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
%   theta as the parameter for regularized logistic regression and the
%   gradient of the cost w.r.t. to the parameters. 

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta.
%               You should set J to the cost.
%               Compute the partial derivatives and set grad to the partial
%               derivatives of the cost w.r.t. each parameter in theta
% solution 1
%h = sigmoid(X * theta);
%left_part = -y' * log(h);
%right_part = (1 - y') * log(1 - h);
%theta_zero = theta;
%theta_zero(1) = 0;
%lambda_cost_part = (lambda / (2 * m)) * sum(theta_zero .^ 2);
%lambda_gradient_part = (lambda / m) * theta_zero;
%J = (1 / m) * sum(left_part - right_part) + lambda_cost_part;
%grad = (1 / m) * (X' * (h - y)) + lambda_gradient_part;

h = sigmoid(X * theta);
shift_theta = theta(2:size(theta));
theta_reg = [0;shift_theta];

J = (1 / m) * sum((-y' * log(h) - (1 - y') * log(1 - h))) + (lambda / (2 * m)) * sum(theta_reg .^ 2);
grad = (1 / m) * (X' * (h - y)) + (lambda / m) * theta_reg;

% =============================================================

end
