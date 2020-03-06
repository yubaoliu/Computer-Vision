
# Introduction
Implementation of basic algorithms of Computer Vision

# Down sample
## files
downsample_img.m
## Input
![](./Matlab/imgs/penny-farthing.png)

## Output
![](./imgs/down_sample_wo_blur.png)
![](./imgs/down_sample_blur.eps)


# Match correspondences
## files
Find_best_match_ssd.m
## Task
    Find patch in strip and return column index (x value) of topleft corner) using sum of square differences (SSD))
## Input
    Image pair from stereo camera
    ![](./Matlab/imgs/flowers-left.png)
    ![](./Matlab/imgs/flowers-right.png)

# Result
![](./imgs/result_ssd.png)

# References
- [Udacity-computer vision](https://classroom.udacity.com/courses/ud810)
