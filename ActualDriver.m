clear all;

driver = java.awt.Robot;

load('TrainedParams.mat');

while true
    
    % take screenshot and edit image
    img = screenShotRGB(500, 300, 901, 301);
    resizedImg = imresize(img, 0.2);
    finalImg = im2bw(resizedImg);
     imshow(finalImg);

    % create features
    final = logical.empty;
    final = [final; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    final = [1 final];
    
    % find prediction
    h1 = Sigmoid(final * Theta1');
    h1 = [1 h1];
    h2 = Sigmoid(h1 * Theta2');
    [p, p] = max(h2)
    
end