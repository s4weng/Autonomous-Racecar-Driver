function [J grad] = CostFunction(nn_params, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, ...
                                   X, y, lambda)
                               
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 output_layer_size, (hidden_layer_size + 1));

m = size(X, 1);
         
Theta1_grad = zeros(size(Theta1));
Theta2_grad = zeros(size(Theta2));

X = [ones(m, 1) X];
a2 = Sigmoid(X * Theta1');
a2 = [ones(m, 1) a2];
h = Sigmoid(a2 * Theta2');

y16 = y == 1;
for c = 2:output_layer_size
    y16 = [y16 (y == c)];
end

pos = -1 * y16 .* log(h);
neg = (1 - y16) .* log(1 - h);

reg = (lambda/(2*m))*(sum(sum(Theta1(:, 2:end).^2)) + sum(sum(Theta2(:, 2:end).^2)));

J = (1/m)*sum(sum(pos - neg)) + reg;

for t = 1:m
    
    % feedforward pass
    a1 = X(t, :);
    z2 = a1*Theta1';
    a2 = Sigmoid(z2);
    a2 = [1 a2];
    z3 = a2*Theta2';
    a3 = Sigmoid(z3);
    
    % delta (error) calculation
    delta3 = a3 - y16(t, :);
    temp = Theta2' * delta3';
    temp = temp(2:end, :); % lose the bias
    delta2 = temp' .* SigmoidGradient(z2);
    % Delta accumulation
    Theta1_grad = Theta1_grad + delta2'*a1;
    Theta2_grad = Theta2_grad + delta3'*a2;

end

    Theta1_grad = (1/m) * Theta1_grad + (lambda/m)*([zeros(hidden_layer_size, 1) Theta1(:, 2:end)]);
    Theta2_grad = (1/m) * Theta2_grad + (lambda/m)*([zeros(output_layer_size, 1) Theta2(:, 2:end)]);

% unroll gradients
grad = [Theta1_grad(:) ; Theta2_grad(:)];


end
