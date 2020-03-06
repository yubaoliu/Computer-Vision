import cv2
import numpy as np
import random

img = cv2.imread('../../Assets/Images/flower0.jpeg', 1)

imgInfo = img.shape
height = imgInfo[0]
width = imgInfo[1]

dst = np.zeros((height, width, 3), np.uint8)

mm = 8

for m in range(0, height - mm):
    for n in range(0, width - mm):
        index = int(random.random() * mm) # 0 - range
        (b,g,r) = img[m+index, n+index]
        dst[m, n] = (b, g, r)


cv2.imshow('img', img)
cv2.imshow('dst', dst)
cv2.waitKey(0)