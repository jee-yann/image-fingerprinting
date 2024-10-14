image = imread("images\ss.jpg");
resized = ResizeNearest(image, [200, 4000]);
imshow(resized);