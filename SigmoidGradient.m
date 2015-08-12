function g = SigmoidGradient(z)

g = 1 ./ (1 + exp(-z));
g = g .* (1 - g);

end
