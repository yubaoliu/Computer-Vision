% Find template 2D
% NOTE: Function definition must be the very first piece of code here!

% Test code:
tablet = imread('tablet.png');
imshow(tablet);
glyph = tablet(75:165, 150:185);
imshow(glyph);

[y x] = find_template_2D(glyph, tablet);
disp([y x]); % should be the top-left corner of template in tablet

function [yIndex xIndex] = find_template_2D(template, img)
    % TODO: Find template in img and return [y x] location
    % NOTE: Turn off all output from inside the function before submitting!
    c = normxcorr2(template, img);
    [rawyIndex, rawxIndex] = max(find(c==max(c(:))));
    yIndex = rawyIndex - size(template, 1) + 1;
    xIndex = rawxIndex - size(template, 2) + 1;
end

