clear all;

import java.awt.Robot;

load('TrainedDigitParams.mat')

    
    % take screenshot and edit image
     img = screenShotRGB();
     img = imcrop(img, [1670 1005 180 75]);
     croppedImg1 = imcrop(img, [5.5 7.5 56 70]);
     croppedImg2 = imcrop(img, [65.5 7.5 56 70]);
     croppedImg3 = imcrop(img, [120.5 7.5 56 70]);

     croppedImg1 = imresize(im2bw(croppedImg1), [20 20]);
     croppedImg2 = imresize(im2bw(croppedImg2), [20 20]);
     croppedImg3 = imresize(im2bw(croppedImg3), [20 20]);
     
     
 
     [p1, i1] = Predict(Theta1, Theta2, reshape(croppedImg1, [1, size(croppedImg1, 1)*size(croppedImg1, 2)]));
     [p2, i2] = Predict(Theta1, Theta2, reshape(croppedImg2, [1, size(croppedImg2, 1)*size(croppedImg2, 2)]));
     [p3, i3] = Predict(Theta1, Theta2, reshape(croppedImg3, [1, size(croppedImg3, 1)*size(croppedImg3, 2)]));
     
     i1
     i2
     i3
     
     ans = double(i1)*100 + double(i2)*10 + double(i3);
     ans
