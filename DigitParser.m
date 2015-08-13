% Parses the speedometer for data

for i = 2:500
    
    % read in image
    imgFile = sprintf('Snapshots/out%d.png', i);
    img = imread(imgFile);
    
    % crop/turn black and white
    croppedImg = imcrop(img, [1670 1005 180 75]);
    finalImg = im2bw(croppedImg);
    
    % unroll image matrix into vector, show and save
    imshow(finalImg);
    filename = sprintf('ParsedSpeedSnapshots/o%d.png', i);
    imwrite(finalImg, filename, 'png');
    
end