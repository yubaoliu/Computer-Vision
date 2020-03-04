%% Read Image
frizzy = imread('imgs/frizzy.png');
froomer = imread('imgs/froomer.png');

%% Edge detection
% TODO: Find edges in frizzy and froomer images
frizzy_gray = rgb2gray(frizzy);
froomer_gray = rgb2gray(froomer);


frizzy_edges = edge(frizzy_gray, 'canny');
froomer_edges = edge(froomer_gray, 'canny');

% TODO: Display common edge pixels
figure, imshow(frizzy_edges);
hold on
figure, imshow(froomer_edges);

%% Display common edge pixels
figure, imshow(frizzy_edges & froomer_edges);