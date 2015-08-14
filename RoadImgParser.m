% creates the data for training

final = logical.empty;
load('TrainedDigitParams.mat');

for i = 1:553
    
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
%     croppedImg1 = imcrop(img, [5.5 7.5 56 70]);
%     croppedImg2 = imcrop(img, [65.5 7.5 56 70]);
%     croppedImg3 = imcrop(img, [120.5 7.5 56 70]);
%     
%     croppedImg1 = imresize(croppedImg1, [20 20]);
%     croppedImg2 = imresize(croppedImg2, [20 20]);
%     croppedImg3 = imresize(croppedImg3, [20 20]);
% 
%     p1 = Predict(Theta1, Theta2, reshape(croppedImg1, [1, size(croppedImg1, 1)*size(croppedImg1, 2)]));
%     p2 = Predict(Theta1, Theta2, reshape(croppedImg2, [1, size(croppedImg2, 1)*size(croppedImg2, 2)]));
%     p3 = Predict(Theta1, Theta2, reshape(croppedImg3, [1, size(croppedImg3, 1)*size(croppedImg3, 2)]));
  
    
    % unroll image matrix into vector, show and save
    final = [final; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    imshow(finalImg);
    filename = sprintf('ParsedSnapshots/o%d.png', i);
    imwrite(finalImg, filename, 'png');
    
end

save('imgData.mat', 'final');