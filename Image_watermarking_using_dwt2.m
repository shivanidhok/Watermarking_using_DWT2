clc;clear;close all;
% Shivani Dhok
% Date: February 24, 2020
% Digital Image Processing
% Program for: Image watermarking using discrete wavelet transform.

I1 = imread('lena2.png');
I1_gray = rgb2gray(I1);
[numrows numcols] = size(I1_gray);
I2 = imread('fruit1.jpg');
I2_gray = rgb2gray(I2);
I2_gray = imresize(I2_gray,[numrows numcols]);
[cA1,cH1,cV1,cD1] = dwt2(I1_gray,'haar');
[cA2,cH2,cV2,cD2] = dwt2(I2_gray,'haar');


% Performing watermarking...keep the approx coefficients of second image in
% the diagonal detail of the first image
% Perform idwt
I_watermarked = idwt2(cA1,cH1,cV1,cA2,'haar');
imshow(I1_gray);

figure;
subplot(2,2,1)
imagesc(cA1)
colormap gray
title('Approximation')
subplot(2,2,2)
imagesc(cH1)
colormap gray
title('Horizontal')
subplot(2,2,3)
imagesc(cV1)
colormap gray
title('Vertical')
subplot(2,2,4)
imagesc(cD1)
colormap gray
title('Diagonal')
figure;

imshow(I1_gray);
title('Cover Image')
figure;
imshow(I2_gray)
title('Image to be inserted as watermark')
figure;
imshow(uint8(I_watermarked))
title('Image after watermarking')