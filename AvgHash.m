function hash = AvgHash(image)
% AVGHASH uses the Average Hashing algorithm to convert an m-by-n greyscale 
% image into a hash containing mn bits.
%
% Input:
%   image: An m-by-n uint8 array representing a greyscale image.
% Output:
%   hash: A 1-by-mn logical row vector representing the average hash of 
%   the greyscale image.
%   
% Author: Gian Mohinani

% Calculating the average pixel by finding the mean of all the pixel's
% greyscale intensity in the image and rounding to the nearest integer.
avg_pixel = round(mean(image, "all"));

% Creating the hash logical row vector by flattening the image array and
% comparing each element of the image array to the average pixel.
image = image.';
hash = (image(:)>=avg_pixel).';

end