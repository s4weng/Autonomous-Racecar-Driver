clear all;
close all;

% initialize layer sizes (one hidden layer)
input_layer_size  = 11042;  % Whether car is too fast, and 61*181 pixels
hidden_layer_size = 30;
output_layer_size = 9; % see parse.m for output representation

% load data
load('RoadImgData.mat');
X = +X;
yVals = xlsread('DataRoadResults.xlsx');
y = RoadParse(yVals);
m = size(X, 1);
clear final;

% initialize theta parameters
initial_Theta1 = RandInit(input_layer_size, hidden_layer_size);
initial_Theta2 = RandInit(hidden_layer_size, output_layer_size);

% Unroll parameters
initial_nn_params = [initial_Theta1(:) ; initial_Theta2(:)];

options = optimset('MaxIter', 175);
lambda = 1;

costFunction = @(p) RoadCostFunction(p, ...
                                   input_layer_size, ...
                                   hidden_layer_size, ...
                                   output_layer_size, X, y, lambda);
[nn_params, cost] = fmincg(costFunction, initial_nn_params, options);

% Obtain Theta1 and Theta2 back from nn_params
Theta1 = reshape(nn_params(1:hidden_layer_size * (input_layer_size + 1)), ...
                 hidden_layer_size, (input_layer_size + 1));

Theta2 = reshape(nn_params((1 + (hidden_layer_size * (input_layer_size + 1))):end), ...
                 output_layer_size, (hidden_layer_size + 1));

save('TrainedRoadParams.mat', 'Theta1', 'Theta2');
[pred, index] = Predict(Theta1, Theta2, X);

fprintf('Training Set Accuracy: %f\n', mean(double(index == y)) * 100);