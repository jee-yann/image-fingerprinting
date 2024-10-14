function hamming_distance = HammingDistance(fp1, fp2)
% HAMMINGDISTANCE compares two image fingerprints, and determines the 
% number of positions at which the corresponding values differ.
%
% Input:
%   fp1: A 1-by-n logical row vector for the first fingerprint f1
%   fp2: A 1-by-n logical row vector for the second fingerprint f2
% Output:
%   hamming_distance: An integer representing the number of differing bits 
%   between the two fingerprints.
%
% Author: Gian Mohinani

% Comparing each element in both fingerprint arrays and summing up the
% total times it differs which describes the hamming distance.
hamming_distance = sum(fp1 ~= fp2);

end