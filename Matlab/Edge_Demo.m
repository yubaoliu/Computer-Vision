%% Read Lena image
lena = imread('imgs/lena.jpg');
figure, imshow(lena), title('Original image, color');

%% convert to monochrome (grayscale) using rgb2gray
lenaMono = rgb2gray(lena);

%% Make a blurred/smoothed version
h = fspecial('gaussian', [11 11], 4);
figure, surf(h);

lenaSmooth = imfilter(lenaMono, h);
figure, imshow(lenaSmooth), title('Smoothed image');

%% Method 1: Shift left and right, and show diff image
lenaL = lenaSmooth;
lenaL(:, [1:(end-1)]) = lenaL(:,[2:end]);

lenaR = lenaSmooth;
lenaR(:, [2:(end)]) = lenaR(:, [1:(end-1)]);

lenaDiff = double(lenaR) - double(lenaL);
figure, imshow(lenaDiff, []), title('Difference between right and left shifted images')

%% Method 2: canny edge detector
cannyEdges = edge(lenaMono, 'canny');
figure, imshow(cannyEdges), title('Canny: Original edges');

cannyEdges = edge(lenaSmooth, 'canny');
figure, imshow(cannyEdges), title('Canny: Edges of smoothed image');

%% Method 3: Laplacian of Gaussian
logEdges = edge(lenaMono, 'log');
figure, imshow(logEdges), title('Laplacian of Gaussian');

%% find help
doc edge
