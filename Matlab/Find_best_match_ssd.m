% Load images
left = imread('imgs/flowers-left.png');
right = imread('imgs/flowers-right.png');
figure, imshow(left);
figure, imshow(right);

% Convert to grayscale, double, [0, 1] range for easier computation
left_gray = double(rgb2gray(left)) / 255.0;
right_gray = double(rgb2gray(right)) / 255.0;

% Define image patch location (topleft [row col]) and size
patch_loc = [120 170];
patch_size = [100 100];

% Extract patch (from left image)
patch_left = left_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), patch_loc(2):(patch_loc(2) + patch_size(2) - 1));
figure, imshow(patch_left);

% Extract strip (from right image)
strip_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), :);
figure, imshow(strip_right);

% Now look for the patch in the strip and report the best position (column index of topleft corner)
best_x = find_best_match(patch_left, strip_right);
disp(best_x);
patch_right = right_gray(patch_loc(1):(patch_loc(1) + patch_size(1) - 1), best_x:(best_x + patch_size(2) - 1));
figure, imshow(patch_right);

% Find best match
% Use sum of square differences (SSD), you could also use cross-correlation
function best_x = find_best_match(patch, strip)
    % TODO: Find patch in strip and return column index (x value) of topleft corner
    best_x = 1; % placeholder
    min_diff = Inf;
    [row_strip, col_strip]=size(strip);
    [row_patch, col_patch]=size(patch);
    for x = 1:(col_strip - col_patch + 1 )
        other_patch = strip(:, x:(x + col_patch -1 ));
        diff = sum(sqrt((patch -other_patch).^2), 'all');
%         diff = sumsq((patch - other_patch)(:)); %octave
        if diff < min_diff
            min_diff = diff;
            best_x = x;
        end
    end
end


