clear all;

X = logical.empty;
load('TrainedDigitParams.mat');

for i = 2:302
    
    % read in image
    imgFile = sprintf('Snapshots/out%d.png', i);
    img = imread(imgFile);
    
    % crop/resize/apply saturation mask, turn to black/white
    croppedImg = imcrop(img, [500 300 900 300]);
    resizedImg = imresize(croppedImg, 0.2);
    hsvImage = rgb2hsv(resizedImg);
	sImage = hsvImage(:,:,2) * 2;
    finalImg = im2bw(sImage);
    
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
    
    speed = i1 * 100 + i2 * 10 + i3;
    
    % we pass in whether the vehicle is going over 150
    tooFast = logical.empty;
    if (speed > 150)
        tooFast = true;
    else
        tooFast = false;
    end
        
    % unroll image matrix into vector, show and save
    X = [X; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)]) tooFast];
    % imshow(finalImg);
    filename = sprintf('ParsedSnapshots/o%d.png', i);
    imwrite(finalImg, filename, 'png');
    
end

save('RoadImgData.mat', 'X');