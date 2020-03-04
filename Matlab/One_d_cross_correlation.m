% https://classroom.udacity.com/courses/ud810/lessons/3490398567/concepts/34857386110923
% Find template 1D
% NOTE: Function definition must be the very first piece of code here!

% Test code:
s = [-1 0 0 1 1 1 0 -1 -1 0 1 0 0 -1];
t = [1 1 0];
disp('Signal:'), disp([1:size(s, 2); s]);
disp('Template:'), disp([1:size(t, 2); t]);

index = find_template_1D(t, s);
disp('Index:'), disp(index);


function index = find_template_1D(t, s)
    c = normxcorr2(t, s);
%     disp([1:size(c,2);c]);
    [maxValue rawIndex] = max(c);
    index = rawIndex - size(t, 2) + 1;
end

function index = find_template_1D_old(t, s)
    % TODO: Locate template t in signal s and return index
    % NOTE: Turn off all output from inside the function before submitting!
    ss = size(s, 2);
    st = size(t, 2);
    for i = 1:ss-st
        if s(i:st+i-1) == t
            index = i;
             return
        end
    end
end