
A = imread('ParsedSpeedSnapshots/digit4.png');
B = imresize(A, [20 20]);
load('TrainedDigitParams.mat');
p = Predict(Theta1, Theta2, reshape(B, [1, size(B, 1)*size(B, 2)]))