%% package
pkg load image;

%% Read Image
img = imread('../../imgs/peppers.png');

%% randn
some_number = randn();
disp(some_number);

%% Gaussian noise
noise_sigma = 25;
noisy_img = addGuassionNoise(img, noise_sigma);
imshow(noisy_img);

%% Create a Gaussian Filter
filter_size = 11;
filter_sigma = 2;
filter = fspecial('gaussian', filter_size, filter_sigma);


%% Apply Gaussian filter to remove noise
smoothed = imfilter(noisy_img, filter);
imshow(smoothed);


%% specifying an edge parameter: default
smoothed = imfilter(noisy_img, filter, 0);
imshow(smoothed);

%% specifying an edge parameter: circular
smoothed = imfilter(noisy_img, filter, 'circular');
imshow(smoothed);

%% specifying an edge parameter: replicate
smoothed = imfilter(noisy_img, filter, 'replicate');
imshow(smoothed);

%% specifying an edge parameter: symmetric
smoothed = imfilter(noisy_img, filter, 'symmetric');
imshow(smoothed);

function output=addGuassionNoise(img, sigma)
    noise = randn(size(img)) .* sigma;
    output = img + uint8(noise);
end
