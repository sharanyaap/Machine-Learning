function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %

    %fprintf('hxgrad - y = : %f \n', hxgrad - y);
    
    %theta(iter) = theta(iter) - (alpha / m) * (sum((hxgrad - y) * X));
    
    predthetazero = sum((X * theta) - y) / m;
    %fprintf('predthetazero = : %f \n', predthetazero);
    %predthetaone = sum(((X * theta) - y)) / m;
    % proper formula below
    % predthetaone = (((X * theta)' * X(:,2)) - (y' * X(:,2))) / m;
    predthetaone = (((X * theta)' - y') * X(:,2)) / m;
    theta(1) = theta(1) - (alpha * predthetazero);
    theta(2) = theta(2) - (alpha * predthetaone);
    %fprintf('theta (0) found by gradient descent: %f \n', theta(1));
    %fprintf('theta (1) found by gradient descent: %f \n', theta(2));



    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);
    %fprintf('JHistory found by gradient descent: ');
    %fprintf('%f \n', J_history(iter));
end

end
