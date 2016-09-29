%
% Test POCS-based demosaicking algorithm
%
% For details, please refer to the paper:
%  	Color plane interpolation using alternating projections 
%		Gunturk, B.K.; Altunbasak, Y.; Mersereau, R.M. 
%		Image Processing, IEEE Transactions on , Volume: 11 Issue: 9 , Sept 2002 
%		Page(s): 997 -1013
%
%
% Bahadir K. Gunturk
% Department of Electrical and Computer Engineering
% Louisiana State University
% Email: bahadir@ece.lsu.edu
% URL  : http://www.ece.lsu.edu/~bahadir


close all
clear all;

% Read image
a = uint8(imread('NIKOND40_0008_stage4_from_txt.tif')/256);

% Create Bayer sampled mosaic 
X = mosaic(a);

% Bilinear interpolation
[RGB_bilinear] = interp_bilinear(X);
imshow(uint8(RGB_bilinear)); title('Demosaicking using bilinear interpolation');


% Demosaicing Using Alternating Projections
N_iter = 5;
T = 0.02;
out_pocs = d_pocs(X, N_iter, T);

% Display result
out_pocs = uint8(out_pocs);
RGB_bilinear = uint8(RGB_bilinear);
figure; imshow(uint8(out_pocs)); title('Demosaicking using alternating projections');

RGB_bilinear = im2double(RGB_bilinear);
out_pocs = im2double(out_pocs);

% To load image back into the pipeline, save it as txt files for 3 channels. 
% dlmwrite('.\RGB_bilinear\r.txt',RGB_bilinear(:,:,1),'delimiter',' ', 'precision','%.6f');
% dlmwrite('.\RGB_bilinear\g.txt',RGB_bilinear(:,:,2),'delimiter',' ', 'precision','%.6f');
% dlmwrite('.\RGB_bilinear\b.txt',RGB_bilinear(:,:,3),'delimiter',' ', 'precision','%.6f');
% 
% dlmwrite('.\out_pocs\r.txt',out_pocs(:,:,1),'delimiter',' ', 'precision','%.6f');
% dlmwrite('.\out_pocs\g.txt',out_pocs(:,:,2),'delimiter',' ', 'precision','%.6f');
% dlmwrite('.\out_pocs\b.txt',out_pocs(:,:,3),'delimiter',' ', 'precision','%.6f');

% save image as binary file 
fd = fopen('.\out_pocs\r.txt','w');
    fwrite(fd,out_pocs(:,:,1)','double');
    fclose(fd);
    
fd2 = fopen('.\out_pocs\g.txt','w');
    fwrite(fd2,out_pocs(:,:,2)','double');
    fclose(fd2);
fd3 = fopen('.\out_pocs\b.txt','w');
    fwrite(fd3,out_pocs(:,:,3)','double');
    fclose(fd3);
