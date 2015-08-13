final = logical.empty;

% separate each digit
j = 2;

for i = 2:500
    
    % read in image
    imgFile = sprintf('ParsedSpeedSnapshots/o%d.png', i);
    img = imread(imgFile);
    
    % crop/turn black and white
    croppedImg1 = imcrop(img, [5.5 7.5 56 70]);
    croppedImg2 = imcrop(img, [65.5 7.5 56 70]);
    croppedImg3 = imcrop(img, [120.5 7.5 56 70]);
    imshow(croppedImg1);
    imshow(croppedImg2);
    imshow(croppedImg3);

    % unroll image matrix into vector, show and save
    final = [final; reshape(croppedImg1, [1, size(croppedImg1, 1)*size(croppedImg1, 2)])];
    final = [final; reshape(croppedImg2, [1, size(croppedImg2, 1)*size(croppedImg2, 2)])];
    final = [final; reshape(croppedImg3, [1, size(croppedImg3, 1)*size(croppedImg3, 2)])];

    filename = sprintf('ParsedSpeedSnapshots/digit%d.png', j);
    imwrite(croppedImg1, filename, 'png');
    j = j + 1;
    filename = sprintf('ParsedSpeedSnapshots/digit%d.png', j);
    imwrite(croppedImg2, filename, 'png');
    j = j + 1;
    filename = sprintf('ParsedSpeedSnapshots/digit%d.png', j);
    imwrite(croppedImg3, filename, 'png');
    j = j + 1;
    
end

save('imgSpeedData.mat', 'final');