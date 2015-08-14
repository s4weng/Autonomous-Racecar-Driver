load('TrainedDigitParams.mat')

while true
    
    % take screenshot and edit image
     img = screenShotRGB;
     croppedImg1 = imcrop(img, [5.5 7.5 56 70]);
     croppedImg2 = imcrop(img, [65.5 7.5 56 70]);
     croppedImg3 = imcrop(img, [120.5 7.5 56 70]);
     
     croppedImg1 = imresize(im2bw(croppedImg1), [20 20]);
     croppedImg2 = imresize(im2bw(croppedImg2), [20 20]);
     croppedImg3 = imresize(im2bw(croppedImg3), [20 20]);
 
     [p1, i] = Predict(Theta1, Theta2, reshape(croppedImg1, [1, size(croppedImg1, 1)*size(croppedImg1, 2)]));
     [p2, i] = Predict(Theta1, Theta2, reshape(croppedImg2, [1, size(croppedImg2, 1)*size(croppedImg2, 2)]));
     [p3, i] = Predict(Theta1, Theta2, reshape(croppedImg3, [1, size(croppedImg3, 1)*size(croppedImg3, 2)]));
     
     p1
     p2
     p3
     
end