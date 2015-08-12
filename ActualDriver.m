clear all;

driver = java.awt.Robot;

load('TrainedParams.mat');

while true
    
    % take screenshot and edit image
    img = screenShotRGB(500, 300, 901, 301);
    resizedImg = imresize(img, 0.2);
    hsvImage = rgb2hsv(resizedImg);
	sImage = hsvImage(:,:,2) * 2; % increase saturation 100%
    finalImg = im2bw(sImage);

    % create features
    final = logical.empty;
    final = [final; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    final = [1 final];
    
    % find prediction
    h1 = Sigmoid(final * Theta1');
    h1 = [1 h1];
    h2 = Sigmoid(h1 * Theta2');
    [p, p] = max(h2);
    
    
% Up Brake Left Right Output
%  0   0    0     0      1
%  0   0    0     1      2
%  0   0    1     0      3
%  0   0    1     1      4
%  0   1    0     0      5
%  0   1    0     1      6
%  0   1    1     0      7
%  0   1    1     1      8
%  1   0    0     0      9
%  1   0    0     1      10
%  1   0    1     0      11
%  1   0    1     1      12
%  1   1    0     0      13
%  1   1    0     1      14
%  1   1    1     0      15
%  1   1    1     1      16

% all keys are typed out because they are held down unless released
    if p == 1
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 2
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 3
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyPress(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 5
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyPress(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 6
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyPress(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 7
        driver.keyRelease(java.awt.event.KeyEvent.VK_UP);
        driver.keyPress(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyPress(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 9
        driver.keyPress(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 10
        driver.keyPress(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyRelease(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyPress(java.awt.event.KeyEvent.VK_RIGHT);
        
    elseif p == 9
        driver.keyPress(java.awt.event.KeyEvent.VK_UP);
        driver.keyRelease(java.awt.event.KeyEvent.VK_SPACE);
        driver.keyLeft(java.awt.event.KeyEvent.VK_LEFT);
        driver.keyRelease(java.awt.event.KeyEvent.VK_RIGHT);
    
    else
        break;
        
    end
    
    fprintf('The program has stopped.');
end