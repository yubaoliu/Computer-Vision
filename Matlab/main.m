%% Read Color Images
img = imread('../../imgs/peppers.png');
imshow(img);

%% Image size
disp(size(img));

%% Image class or data type
disp(class(img)); %uint8

%% color to gray

gray = rgb2gray(img);
imshow(gray);
imwrite(gray, "../../imgs/pepers_gray.png");

%% channel
% Matlab indexing from 1
R = img(:,:,1);
G = img(:,:,2);
B = img(:,:,3);

%% draw line
line([1 512],[256 256], 'color', 'r');

%% plot
plot(G(256, :));

%% At a given location (row, col)
disp(img(101:103, 201:203))

%% crop
cropped = img(110:310, 10:160);
disp(size(cropped));
imshow(cropped);

%% Add
dolphin = imread('../../imgs/dolphin.png');
bicycle = imread('../../imgs/bicycle.png');

dolphin = imresize(dolphin, [320, 500]);
bicycle = imresize(bicycle, [320, 500]);

disp(size(dolphin));
disp(size(bicycle));

% (183+152)/2 = 127
% 183/2 + 152/2 = 168
% [0, 255]
added = blend(dolphin, bicycle, 0.5);
imshow(added);

%% scale
dolphin = imread('../../imgs/dolphin.png');
imshow(scale(dolphin, 1.5));