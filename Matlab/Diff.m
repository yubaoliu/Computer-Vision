
dolphin = imread('../../imgs/dolphin.png');
bicycle = imread('../../imgs/bicycle.png');

dolphin = imresize(dolphin, [320, 500]);
bicycle = imresize(bicycle, [320, 500]);

abs_diff = imabsdiff(dolphin, bicycle);
imshow(abs_diff);