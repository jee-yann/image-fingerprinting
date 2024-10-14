function resized = ResizeNearest(image, dimensions)
% RESIZENEAREST uses the Nearest Neighbour Interpolation algorithm to 
% resize an image to the specified dimensions.
%
% Inputs:
%   image: An m-by-n-by-p uint8 array representing a greyscale (p = 1) 
%   or a RGB colour (p = 3) image.
%   dimensions: A 1-by-2 double array containing two values (i, j) 
%   representing the desired height and width to resize the image to.
% Output:
%   resized: An m-by-n-by-1 uint8 array representing a greyscale image.
%
% Author: Gian Mohinani

% Storing the original dimensions of an image and the specified dimensions
% it will transfrom to into variables.
[m, n, p] = size(image);
i = dimensions(1);
j = dimensions(2);

% Calculating the row and column ratios by dividing the original number of
% rows/columns in an image array by the new resized image's rows/columns.
row_ratio = m/i;
col_ratio = n/j;

% Converting the original image array to double format for it to be used in
% calculations so it will not prematurely round during intermediate
% results.
image = double(image);

% Initializing the final resized image array which will be i-by-j-by-p.
resized = zeros(i, j, p, "uint8");

% Iterating through each row and column in the resized image array which
% describes the position of each pixel.
for row = 1:i
    for col = 1:j
        % Calculating the relative position of our resized pixel in the
        % original image using the Nearest Neighbour Interpolation 
        % algorithm.
        og_row = ceil((row - 0.5) * row_ratio);
        og_col = ceil((col - 0.5) * col_ratio);   

        % Assigning the resized image pixels with the original image
        % relative pixel positions.
        resized(row, col, :) = image(og_row, og_col, :);
    end
end

end