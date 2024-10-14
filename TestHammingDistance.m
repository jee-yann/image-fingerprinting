image = imread("images\watch.png");
nearest_grey_image = ResizeNearest(GreyscaleLuma(image), [8 8]);
image2 = imread("images/headshot.jpg");
car = ResizeNearest(GreyscaleLuma(image2), [8, 8]);
fp1 = AvgHash(nearest_grey_image);
fp2 = AvgHash(car);
%HammingDistance(fp1, fp2)

HammingDistance([1 0 1 1], [1 0 1 1])
HammingDistance([1 0 1 1], [1 1 1 1])

