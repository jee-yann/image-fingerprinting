image = imread("images\watch.png");
nearest_grey_image = ResizeNearest(GreyscaleLuma(image), [4 4]);
DiffHash(nearest_grey_image)
