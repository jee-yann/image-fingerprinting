image = imread("images\watch.png");
nearest_grey_image = ResizeNearest(GreyscaleLuma(image), [8 8]);
fp = AvgHash(nearest_grey_image);
DispFP(fp)