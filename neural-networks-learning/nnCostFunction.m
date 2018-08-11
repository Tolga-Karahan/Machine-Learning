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

% Adding bias to feature vector
X = [ones(m, 1) X];

% Computing outputs of first layer
first_activation = sigmoid(X * Theta1');

% Adding bias to second layer's activations
first_activation = [ones(size(first_activation, 1), 1) first_activation];

% Computing output of neural network
output = (sigmoid(first_activation * Theta2'));

% Computing cost of the outputs
cost = 0;

for class=1:num_labels
    out_vec = zeros(m, 1);
    for ex=1:m      
        if y(ex, 1) == class
            out_vec(ex, 1) = 1;
        else
            out_vec(ex, 1) = 0;
        end
    end
    cost = cost + out_vec' * log(output(:,class)) + (ones(m, 1) - out_vec)' * log(ones(m, 1) - output(:,class));        
end

% Computing regularization parameters
reg_params = sum(sum(Theta1(:,2:size(Theta1, 2)) .^ 2)) + sum(sum(Theta2(:,2:size(Theta2, 2)) .^ 2));

% Computing regularized cost
J = (-1 / m) * cost + (lambda / (2 * m)) * reg_params;

% -------------------------------------------------------------
% Now regularized cost is computed and gradients must be computed with backpropagation algorithm
% Do one vs all classification on labels and for convenience put the result vectors in a matrix
labels = zeros(m, num_labels);

for class=1:num_labels
    for i=1:m
        if class == y(i, 1)
            labels(i, class) = 1;
        else
            labels(i, class) = 0;
        end
    end
end  

% Implementation of Backpropagation Algorithm
% Calculating gradients of cost function in respect to each weight in the theta matrices

for i=1:m
    % First compute the outputs with feedforward
    feature = X(i,:);    
    hidden  = first_activation(i,:);
    out     = output(i,:);
    
    % Calculating error of output layer is just taking difference between
    % neural network's prediction and actual label then gradients of the
    % Theta2 matrice is computed
    out_error       = (out - labels(i,:))';
    Theta2_grad     = Theta2_grad + ((1 / m) * (out_error * hidden));
    
    % Error of hidden layer computed via back propagating the error of output layer
    % With using error of hidden layer gradients of the Theta1 matrice is computed
    hidden_error    = (Theta2' * out_error) .* ([1 sigmoidGradient(X(i,:) * Theta1')])';
    hidden_error    = hidden_error(2:end);
    Theta1_grad     = Theta1_grad + ((1 / m) * (hidden_error * feature));
end
% =========================================================================
% Now backpropagation implemented without regularization parameters
% Let's add the regularization parameters to gradients computed with backpropagation

Theta2_grad(:,2:end) = Theta2_grad(:,2:end) + (lambda / m) * Theta2(:, 2: end);
Theta1_grad(:,2:end) = Theta1_grad(:,2:end) + (lambda / m) * Theta1(:, 2: end);

% Unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
