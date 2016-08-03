close all
clear all


stage11= imread('.\images\NIKOND40_0008_stage4_run_through_pipeline_alt_proj.tif');
stage4 = imread('.\images\NIKOND40_0008_stage11_bilinear_int.tif');
[stage11_crop, rect] = imcrop(stage11);
% figure, imshow(stage11);
% figure, imshow(stage4);
% imhist(I(rect(1):rect(1)+rect(3),rect(2):rect(2)+rect(4),:))
stage11_croped = stage11(rect(2):(rect(2)+rect(4)),rect(1):(rect(1)+rect(3)),:);
stage4_croped = stage4(rect(2):(rect(2)+rect(4)),rect(1):(rect(1)+rect(3)),:);
figure, imshow(stage11_croped);
figure, imshow(stage4_croped);
% figure, imhist(stage11_croped(:,:,1))
% figure, imhist(stage4_croped(:,:,1))
% figure, imhist(stage11_croped(:,:,2))
% figure, imhist(stage4_croped(:,:,2))
% figure, imhist(stage11_croped(:,:,3))
% figure, imhist(stage4_croped(:,:,3))
