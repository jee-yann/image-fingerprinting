function greyscale = GreyscaleLuma(image)
% GreyscaleLuma function converts each pixel from an RGB image to a
% greyscale equivalent to create a new image. This is done by applying a 
% weighted sum formula using the red, blue and green pixel's intensities
%
% Input:
%   image: An m-by-n-by-3 uint8 array representing an RGB colour image.
% Output:
%   greyscale: An m-by-n-by-1 uint8 array representing a greyscale image.
%
% Author: Gian Mohinani

% Initializing the greyscale image array.
greyscale = zeros(height(image), width(image), "uint8");

% Iterating through each combination of rows and columns in the greyscale
% image array which describes the position of each and every pixel.
for row = 1:height(image)
    for col = 1:width(image)
        % Retrieving the RGB values for the current pixel position
        % iteration and using them in a formula to calculate the greyscale
        % version. This new greyscale pixel will be added to the final
        % image in its corresponding position to the original image.
        RGB = double(image(row, col, :));
        greyscale(row, col) = 0.2126*RGB(1) + 0.7152*RGB(2) + 0.0722*RGB(3);
    end
end

end