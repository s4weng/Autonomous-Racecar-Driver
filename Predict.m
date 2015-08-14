function [p, i] = Predict(Theta1, Theta2, X)

m = size(X, 1);
output_layer_size = size(Theta2, 1);

h1 = Sigmoid([ones(m, 1) X] * Theta1');
h2 = Sigmoid([ones(m, 1) h1] * Theta2');
[p, i] = max(h2, [], 2);

end