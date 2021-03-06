
% Test code:

%% Load images
left = imread('img/flowers-left.png');
right = imread('img/flowers-right.png');

%% show source images
figure, imshow(left);
figure, imshow(right);

%% Convert to grayscale, double, [0, 1] range for easier computation
left_gray = double(rgb2gray(left)) / 255.0;
right_gray = double(rgb2gray(right)) / 255.0;

%% Define strip row (y) and square block size (b)
y = 120;
b = 100;

%% Extract strip from left image
strip_left = left_gray(y:(y + b - 1), :);
figure, imshow(strip_left);

%% Extract strip from right image
strip_right = right_gray(y:(y + b - 1), :);
figure, imshow(strip_right);

%% Now match these two strips to compute disparity values
disparity = match_strips(strip_left, strip_right, b);
disp(disparity);
figure, plot(disparity);

% TODO: Match two strips to compute disparity values
function disparity = match_strips(strip_left, strip_right, b)
    % For each non-overlapping patch/block of width b in the left strip,
    % find the best matching position (along X-axis) in the right strip.
    % Return a vector of disparities (left X-position - right X-position).
    % Note: Only consider whole blocks that fit within image bounds.
    num_blocks = floor(size(strip_left, 2)/b);
    disparity = zeros([1 num_blocks]);
    for block = 0:(num_blocks-1)
        x_left = block * b + 1;
        patch_left = strip_left(:,x_left: x_left+b-1);
        x_right = find_best_match(patch_left, strip_right);
        disparity(1, block+1) = (x_left - x_right);
    end
end

% % Find best match for a patch in a given strip (SSD)
% % Note: You may use this or roll your own
% function best_x = find_best_match(patch, strip)
%     min_diff = Inf;
%     best_x = 0; % column index (x value) of topleft corner; haven't found it yet
%     for x = 1:(size(strip)(2) - size(patch)(2))
%         other_patch = strip(:, x:(x + size(patch)(2) - 1));
%         diff = sumsq((patch - other_patch)(:));
%         if diff < min_diff
%             min_diff = diff;
%             best_x = x;
%         end
%     end
% end

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