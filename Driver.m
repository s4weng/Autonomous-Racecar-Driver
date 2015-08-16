clear all;

driver = java.awt.Robot;

load('TrainedRoadParams.mat');
Road_Theta1 = Theta1;
Road_Theta2 = Theta2;

load('TrainedDigitParams.mat');

while true
    
    % take screenshot and edit image
    img = screenShotRGB;
    croppedImg = imcrop(img, [0.5 600 1920 256.5]);
    resizedImg = imresize(croppedImg, 0.2);
    hsvImage = rgb2hsv(resizedImg);
	sImage = hsvImage(:,:,2) * 2; % increase saturation 100%
    finalImg = im2bw(sImage);
    
    % imshow(finalImg);
        
    % crop the speedometer, use it as a feature
    img = imcrop(img, [1670 1005 180 75]);
    img = im2bw(img);
    croppedImg1 = imcrop(img, [5.5 7.5 56 70]);
    croppedImg2 = imcrop(img, [65.5 7.5 56 70]);
    croppedImg3 = imcrop(img, [120.5 7.5 56 70]);
     
    croppedImg1 = imresize(croppedImg1, [20 20]);
    croppedImg2 = imresize(croppedImg2, [20 20]);
    croppedImg3 = imresize(croppedImg3, [20 20]);
 
    [p1, i1] = Predict(Theta1, Theta2, reshape(croppedImg1, [1, size(croppedImg1, 1)*size(croppedImg1, 2)]));
    [p2, i2] = Predict(Theta1, Theta2, reshape(croppedImg2, [1, size(croppedImg2, 1)*size(croppedImg2, 2)]));
    [p3, i3] = Predict(Theta1, Theta2, reshape(croppedImg3, [1, size(croppedImg3, 1)*size(croppedImg3, 2)]));
      
    % calculate speed from individual digits
    i1 = double(i1);
    i2 = double(i2);
    i3 = double(i3);
    
    if i1 == 11 % index 11 represents value 0
        i1 = 0;
    end
    
    if i2 == 11
        i2 = 0;
    end
    
    speed = i1 * 100 + i2 * 10 + i3;
        
    % we pass in whether the vehicle is going over 100
    if (speed < 80)
        speed = 2;
    elseif (speed < 100)
        speed = 3;
    else
        speed = 4;
    end
            
    final = logical.empty;
    final = reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)]);
    final = [1 final speed];

    % find prediction
    h1 = Sigmoid(final * Road_Theta1');
    h1 = [1 h1];
    h2 = Sigmoid(h1 * Road_Theta2');
    [p, p] = max(h2);
    
    
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
        driver.keyPress(java.awt.event.KeyEvent.VK_A);
        driver.keyRelease(java.awt.event.KeyEvent.VK_D);
    
     %else
     %   break;
     
     pause(0.01); % snapshot every second
        
     end
    
end

fprintf('The program has stopped.');