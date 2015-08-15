clear all;

X = logical.empty;
load('TrainedDigitParams.mat');

for i = 1:1019
    
    % read in image
    imgFile = sprintf('Snapshots/out%d.png', i);
    img = imread(imgFile);
    
    % crop/resize/apply saturation mask, turn to black/white
    croppedImg = imcrop(img, [0.5 600 1920 256.5]);
    resizedImg = imresize(croppedImg, 0.2);
    hsvImage = rgb2hsv(resizedImg);
	sImage = hsvImage(:,:,2) * 2;
    finalImg = im2bw(sImage);
    imshow(finalImg);
    
    % unroll image matrix into vector, show and save
    X = [X; reshape(finalImg, [1, size(finalImg, 1)*size(finalImg, 2)])];
    % imshow(finalImg);
    filename = sprintf('ParsedSnapshots/o%d.png', i);
    imwrite(finalImg, filename, 'png');
    
end

fprintf('X: %f %f\n', size(X, 1), size(X, 2));

% duplicate data for 2 (speed under 70), 3 (70-100), 4 (over 100)
X = repmat(X, 3, 1);
fprintf('X after repmat: %f %f\n', size(X, 1), size(X, 2));

X = [X zeros(size(X, 1), 1)];
fprintf('X after appending zeros column: %f %f\n', size(X, 1), size(X, 2));

X(1:1019, end) = 2;
X(1020:2038, end) = 3;
X(2039:3057, end) = 4;

save('RoadImgData.mat', 'X');