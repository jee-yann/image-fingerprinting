function fp_collection = FingerprintCollection(file_names, hash_type, resize_type)
% FINGERPRINTCOLLECTION stores all of the image fingerprints from a list of 
% image filenames so they can be quickly looked up for comparison.
%
% Input:
%   file_names: An m-by-1 string array representing a list of image file 
%   names.
%   hash_type: A character vector containing either 'AvgHash' or 
%   'DiffHash'.
%   resize_type: A character vector containing either 'Nearest' or 'Box'.
% Output:
%   fingerprints: An m-by-1 cell array containing the fingerprint from each 
%   image file.
%
% Author: Gian Mohinani

% Initializing the empty fingerprint collection cell array.
fp_collection = cell(length(file_names), 1);

% Iterating through all the file names provided.
for file = 1:length(file_names)
    % Accessing the image array from the image file.
    image = imread(file_names{file});

    % Finding the fingerprint from the image using the specified hash
    % algorithm and resize algorithm to use.
    fp = ImageFingerprint(image, hash_type, resize_type);

    % Addding the fingerprint to the fingerprint collection array
    fp_collection{file} = fp;
end

end
