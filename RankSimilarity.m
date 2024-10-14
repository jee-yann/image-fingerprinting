function RankSimilarity(search, file_names, fp_collection, n)
% RANKSIMILARITY displays n image files ranked by descending similarity 
% (i.e., the image most similar to the search image will be at the top of
% the list).
%
% Inputs:
%   search: A 1-by-64 logical row vector representing the image fingerprint 
%   to search. 
%   file_names: An m-by-1 string array representing a list of image file 
%   names. 
%   fp_collection: An m-by-1 cell array containing a collection of image 
%   fingerprints. 
%   n : An integer n denoting how many image fingerprint matches to display
% Output: 
%   None
%   
% Author: Gian Mohinani

% Initializing an empty string to store the output to be displayed
rankings = cell(n, 1);

for file = length(file_names):-1:1
    fp = fp_collection{file};
    current_top = 100;
    for i = length(file_names):-1:1
        if HammingDistance(search, fp) < HammingDistance(search, current_top) && ...
                ~ismember(search, rankings)
            current_top = fp;
        end
    end
    rankings{end+1} = current_top;
end

for line_number = 1:n
    if n < 10 
        rank = sprintf("%2d. ", line_number);
    else
        rank = sprintf("%1d. ", line_number);
    end
    ham_value = HammingDistance(search, rankings{line_number});
    ham = sprintf("%2d", ham_value);

    fprintf(rank + ham + " - " + "\n")
end