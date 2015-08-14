clear all;

driver = java.awt.Robot;

load('TrainedRoadParams.mat');

while true
    
    % take screenshot and edit image
    img = screenShotRGB;
    img = imcrop(img, [500 300 900 300]);
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
    [p, p] = max(h2)
    
    
% Up Brake Left Right Output
%  0   0    0     0      1
%  0   0    0     1      2
%  0   0    1     0      3
%  0   1    0     0      4
%  0   1    0     1      5
%  0   1    1     0      6
%  1   0    0     0      7
%  1   0    0     1      8
%  1   0    1     0      9

% all keys are typed out because they are held down unless released
    if p == 1
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 2
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyPress(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 3
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyPress(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 4
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyPress(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 5
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyPress(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyPress(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 6
        driver.keyRelease(java.awt.event.KeyEvent.VK_W);
        driver.keyPress(java.awt.event.KeyEvent.VK_S);
        driver.keyPress(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 7
        driver.keyPress(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
        
    elseif p == 8
        driver.keyPress(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyRelease(java.awt.event.KeyEvent.VK_A);
        driver.keyPress(java.awt.event.KeyEvent.VK_D);
        
     elseif p == 9
        driver.keyPress(java.awt.event.KeyEvent.VK_W);
        driver.keyRelease(java.awt.event.KeyEvent.VK_S);
        driver.keyLeft(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
    
     %else
     %   break;
     
     pause(1); % snapshot every second
        
     end
    
end

fprintf('The program has stopped.');