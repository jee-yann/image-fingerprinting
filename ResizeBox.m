function resized = ResizeBox(image, dimensions)
% RESIZEBOX uses the Box Sampling algorithm to resize an image to the 
% specified dimensions.
%
% Inputs:
%   image: An m-by-n-by-p uint8 array representing a greyscale (p = 1) 
%   or a RGB colour (p = 3) image.
%   dimensions: A 1-by-2 double array containing two values (i, j) 
%   representing the desired height and width to resize the image to.
% Output:
%   resized: An i-by-j-by-p uint8 array representing the resized greyscale 
%   image.
%
% Author: Gian Mohinani

% Storing the original dimensions of an image and the specified dimensions
% it will transfrom to into variables.
[m, n, p] = size(image);
i = dimensions(1);
j = dimensions(2);

% Calculating the size of the box boundary region to capture pixels in the
% original image.
box_height = m/i;
box_width = n/j;

% Converting the original image array to double format for it to be used in
% calculations so it will not prematurely round during intermediate
% results.
image = double(image);

% Initializing the final resized image array which will be i-by-j-by-p.
resized = zeros(i, j, p, "uint8");

% Iterating through each row and column in the resized image array which
% describes the position of each pixel and the box region in the original
% image array.
for row = 1:i
    for col = 1:j
        % Finding the start and end coordinates of a box in the original
        % image which will be used to capture the pixels the region and
        % find the average intensities of the pixels. Also checking if the
        % number is at the boundary (ends with .5) and if so will round
        % appropriately
        start_x = ((col - 1) * box_width) + 1;
        if mod(start_x, 1) == 0.5
            start_x = round(start_x - 1);
        else
            start_x = round(start_x);
        end

        start_y = ((row - 1) * box_height) + 1;
        if mod(start_y, 1) == 0.5
            start_y = round(start_y - 1);
        else
            start_y = round(start_y);
        end

        end_x = round(col * box_width);
        end_y = round(row * box_height);
        
        box_pixels = image(start_y:end_y, start_x:end_x, :);
        
        % Storing the rounded out average values of the greyscale/RGB 
        % values.
        pixel = round(mean(box_pixels, [1 2]));

        % Assigning the resized image pixels with the 'average' pixel from
        % the current box iteration.
        resized(row, col, :) = uint8(pixel);
    end
end

end