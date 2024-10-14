image = imread("images\watch.png");
nearest_grey_image = ResizeNearest(GreyscaleLuma(image), [8 8]);
AvgHash(nearest_grey_image)
