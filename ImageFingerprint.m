function fp = ImageFingerprint(image, hash_type, resize_type)
% IMAGEFINGERPRINT creates a 64-bit image fingerprint using the specified 
% hashing and resizing algorithm for a given colour image.
%
% Input:
%   image: An m-by-n-by-3 uint8 array representing an RGB colour image.
%   hash_type: A character vector containing either 'AvgHash' or 
%   'DiffHash'.
%   resize_type: A character vector containing either 'Nearest' or 'Box'.
% Output:
%   fp: A 1-by-64 logical row vector representing the image fingerprint.
%
% Author: Gian Mohinani

% Converting the image into a greyscale image
greyscale = GreyscaleLuma(image);

% Checking the hash type which determines if we need to add or remove 1
% column in the greyscale image for the hashing to work
if strcmp(hash_type, 'AvgHash')
    dimensions = [8 8];
elseif strcmp(hash_type, 'DiffHash')
    dimensions = [8 9];
end

% Applying the correct resize algorithm on the image
if strcmp(resize_type, 'Nearest')
    resized = ResizeNearest(greyscale, dimensions);
elseif strcmp(resize_type, 'Box')
    resized = ResizeBox(greyscale, dimensions);
end

% Applying the correct hashing algorithm to obtain the fingerprint.
if strcmp(hash_type, 'AvgHash')
    fp = AvgHash(resized);
elseif strcmp(hash_type, 'DiffHash')
   fp = DiffHash(resized);
end

end
