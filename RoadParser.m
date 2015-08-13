% creates the data for training

final = logical.empty;

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
    
    % unroll image matrix into vector, show and save
    final = [final; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    imshow(finalImg);
    filename = sprintf('ParsedSnapshots/o%d.png', i);
    imwrite(finalImg, filename, 'png');
    
end

save('imgData.mat', 'final');