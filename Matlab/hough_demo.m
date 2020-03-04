%% Read Lena image
img = imread('imgs/pic1.png');
figure, imshow(img), title('Original image, color');

%% convert to monochrome (grayscale) using rgb2gray
lenaMono = rgb2gray(img);

edges = edge(lenaMono, 'canny');
figure, imshow(edges), title('edges');

%% Apply Hough transrom to find candidate lines
[accum, theta, rho] = hough(edges);
figure, imagesc(accum, 'XData', theta, 'YData', rho), title('Hough accumulator');

%% Find peaks in the Hough accumulator matrix
peaks = houghpeaks(accum, 100);
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)), 'rs');
hold off;

%% peaks: The first column has row values, or y values; and the second one has x values
size(peaks);

%% Find lines (segments) in the image
line_segs = houghlines(edges, theta, rho, peaks);

%% plot line segments
figure, imshow(img), title('Line segments');
hold on;
for k = 1: length(line_segs)
    endpoints = [line_segs(k).point1; line_segs(k).point2];
    plot(endpoints(:,1), endpoints(:,2),"LineWidth", 2, 'Color', 'green');
end

%% More precise lines
peaks = houghpeaks(accum, 100, 'Threshold', ceil(0.6*max(accum(:))), 'NHoodSize', [5, 5]);
hold on;
plot(theta(peaks(:,2)), rho(peaks(:,1)), 'rs');
hold off;

