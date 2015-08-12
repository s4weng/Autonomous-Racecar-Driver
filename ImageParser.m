% creates the data for training

final = logical.empty;

for i = 10:553
    imgFile = sprintf('Snapshots/out%d.png', i);
    img = imread(imgFile);
    croppedImg = imcrop(img, [500 300 900 300]);
    resizedImg = imresize(croppedImg, 0.2);
    hsvImage = rgb2hsv(resizedImg);
	sImage = hsvImage(:,:,2) * 2;
    finalImg = im2bw(sImage);
    final = [final; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    imshow(finalImg);
end

save('imgData.mat', 'final');