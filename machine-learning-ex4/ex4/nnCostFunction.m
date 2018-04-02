function [J grad] = nnCostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   num_labels, ...
                                   X, y, lambda)
%NNCOSTFUNCTION Implements the neural network cost function for a two layer
%neural network which performs classification
%   [J grad] = NNCOSTFUNCTON(nn_params, hidden_layer_size, num_labels, ...
%   X, y, lambda) computes the cost and gradient of the neural network. The
%   parameters for the neural network are "unrolled" into the vector
%   nn_params and need to be converted back into the weight matrices. 
% 
%   The returned parameter grad should be a "unrolled" vector of the
%   partial derivatives of the neural network.
%

% Reshape nn_params back into the parameters Theta1 and Theta2, the weight matrices
% for our 2 layer neural network
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 num_labels, (hidden_layer_size + 1));

% Setup some useful variables
m = size(X, 1);
         
% You need to return the following variables correctly 
J = 0;
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

% ====================== YOUR CODE HERE ======================
% Instructions: You should complete the code by working through the
%               following parts.
%
% Part 1: Feedforward the neural network and return the cost in the
%         variable J. After implementing Part 1, you can verify that your
%         cost function computation is correct by verifying the cost
%         computed in ex4.m
%
% Part 2: Implement the backpropagation algorithm to compute the gradients
%         Theta1_grad and Theta2_grad. You should return the partial derivatives of
%         the cost function with respect to Theta1 and Theta2 in Theta1_grad and
%         Theta2_grad, respectively. After implementing Part 2, you can check
%         that your implementation is correct by running checkNNGradients
%
%         Note: The vector y passed into the function is a vector of labels
%               containing values from 1..K. You need to map this vector into a 
%               binary vector of 1's and 0's to be used with the neural network
%               cost function.
%
%         Hint: We recommend implementing backpropagation using a for-loop
%               over the training examples if you are implementing it for the 
%               first time.
%
% Part 3: Implement regularization with the cost function and gradients.
%
%         Hint: You can implement this around the code for
%               backpropagation. That is, you can compute the gradients for
%               the regularization separately and then add them to Theta1_grad
%               and Theta2_grad from Part 2.
%
X = [ones(m, 1) X];  % adding the bias unit for the input values
a_2 = sigmoid(X * Theta1');  % define the second layer activation units
a_2 = [ones(m, 1) a_2];  % add the bias unit to the second activation layer
h = sigmoid(a_2 * Theta2'); % define the output layer activation units

% recode the labels as vectors containing only values 0 or 1
% Now we need to define Y to use in our cost function. Y should be a matrix consisted of
% m rows (m training examples) and K - "num_labels" - columns
% (10 possible classifications per training example)
% 0 0 0 0 0 0 0 0 0 1
% 0 0 0 0 0 0 0 0 0 1
% . . . . . . . . . .
% 0 1 0 0 0 0 0 0 0 0
% . . . . . . . . . .
% 1 0 0 0 0 0 0 0 0 0
% 1 0 0 0 0 0 0 0 0 0
            
% It is exactly same as y but is just an m - dimmensional vector of K - dimmensional vectors if it makes sense.
            
% converting y into Y
            
I = eye(num_labels);            % define an identity matrix
Y = zeros(m, num_labels);       % define a default Y matrix of zeros
for i = 1:m,
    Y(i, :) = I(y(i), :);       % construct the Y matrix
end


J = - (1 / m) * sum( sum( Y .* log(h) + (1 - Y) .* log(1 - h)));
temp_theta_1 = Theta1;
temp_theta_2 = Theta2;
temp_theta_1(:, 1) = 0;
temp_theta_2(:, 1) = 0;
regularization_term = (lambda / (2 * m)) * (sum(sum(temp_theta_1 .* temp_theta_1)) + sum(sum(temp_theta_2 .* temp_theta_2)));
J = J + regularization_term;







% -------------------------------------------------------------

% =========================================================================

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
