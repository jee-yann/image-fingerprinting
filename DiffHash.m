function hash = DiffHash(image)
% DIFFHASH converts an m-by-(n + 1) greyscale image into a hash containing 
% mn bits using the Differential Hashing algorithm.
%
% Input:
%   image: An m-by-(n + 1) uint8 array representing a greyscale image.
% Output:
%   hash: A 1-by-mn logical row vector representing the differential hash 
%   of the greyscale image.
%   
% Author: Gian Mohinani

% Storing the original dimensions (height and width) of the image.
[m, n] = size(image);

% Defining n to represent the number of columns - 1 as the input image
% array is defined to have "n + 1" number of columns.
n = n - 1;

% Initializing the differential hash row vector which will have dimensions
% 1-by-mn.
hash = false(1, m*n);

% Iterating from the very first column of pixels to the final column and
% doing this for every row of pixels in the image.
for row = 1:m
    for col = 1:n
        % Adding the result of whether the current pixel value is greather
        % than or equal to the pixel value one column to the right into the
        % differential hash.
        hash((row-1)*n + col) = image(row, col) >= image(row, col+1);
    end
end

end