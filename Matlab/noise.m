%% randn [1 ...]
noise = randn([1 100]);
% Let's say we want the centers to be integers, from minus three to plus
% three
% Hist returns two values, one is the count of elements, and the second is
% the bin centers
[n, x] = hist(noise, [-3 -2 -1 0 1 2 3]);
disp([x; n]) % the first row being the bin centers, and the second row being the counts
plot(x, n);

%% linespace
noise = randn([1 10000]);
[n, x] = hist(noise, linspace(-3, 3, 50));
% disp([x; n]); % the first row being the bin centers, and the second row being the counts
plot(x, n);
