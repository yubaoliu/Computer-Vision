%% load image
img = imread('../../imgs/lena.jpg');
imshow(img);

%% Add salt and pepper noise
noisy_img = imnoise(img, 'salt & pepper', 0.02);
imshow(noisy_img);

%% Apply a median filter
median_filtered = medfilt3(noisy_img);
imshow(median_filtered);
