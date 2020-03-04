%% sobel filter
img = imread('../../imgs/peppers.png');
img = rgb2gray(img);
filt = fspecial('sobel');
outimg = imfilter(double(img), filt);
imagesc(outimg);
colormap gray;

