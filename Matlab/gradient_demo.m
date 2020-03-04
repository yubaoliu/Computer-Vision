

%% Load and convert image to double type, range [0, 1] for convenience
img = double(imread('octagon.png')) / 255.; 
imshow(img); % assumes [0, 1] range for double images

%% Compute x, y gradients
[gx, gy] = imgradientxy(img, 'sobel'); % Note: gx, gy are not normalized
imshow((gx+4)/8) % gx:[-4 4]

%% Obtain gradient magnitude and direction
[gmag, gdir] = imgradient(gx, gy);
imshow(gmag / (4 * sqrt(2))); % mag = sqrt(gx^2 + gy^2), so [0, (4 * sqrt(2))]
imshow((gdir + 180.0) / 360.0); % angle in degrees [-180, 180]

%% Find pixels with desired gradient direction
my_grad = select_gdir(gmag, gdir, 0.15, 30, 45); % 45 +/- 15
imshow(my_grad);  % NOTE: enable after you've implemented select_gdir

% Gradient Direction
function result = select_gdir(gmag, gdir, mag_min, angle_low, angle_high)
    % TODO Find and return pixels that fall within the desired mag, angle range
    result = gmag >= mag_min & angle_low <= gdir & gdir <= angle_high;
end