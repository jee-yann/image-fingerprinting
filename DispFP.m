function DispFP(fp)
% DISPFP displays the image fingerprint in a pretty format on one line by
% grouping the bits into bytes (8 bits) and spacing out each byte using one
% space character.
%
% Input:
%   fp: A 1-by-n logical row vector representing an image fingerprint.
% Output:
%   None
%   
% Author: Gian Mohinani

% Initializing an empty string to store the output to be displayed
output = "";

% Iterating through every byte (8 bits) in the fingerprint array
for bit = 1:8:length(fp)
    % Checking if there is a group of 8 bits left to iterate through. If
    % not then the last set of 1s and 0s will not be in a group of 8 but
    % will be added anyway to the output. 
    if length(fp) - bit + 1 < 8
        output = output + num2str(fp(bit:end), '%1d');
        break
    end

    % Converting the group of 8 bits in the logical array into a string
    % seperated by no characters.
    byte = num2str(fp(bit:bit+7), '%1d');
    
    % Adding the byte to the output string with a space character at the
    % end to prepare for adding more bits.
    output = output + byte + " ";
end

% Displaying the grouped output string of bits while removing any trailing
% whitespace and adding a new line character.
fprintf("%s\n", strip(output));

end