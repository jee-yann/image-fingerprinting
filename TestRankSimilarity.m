filenames = ["images\Balloons1.jpg"; "images\Basket1.jpg"; "images\watch.png"; "images\Hat1.jpg"];
fp_collection = FingerprintCollection(filenames, 'DiffHash', 'Box');
watch = imread("images\watch.png");
watch_fp =  ImageFingerprint(watch, 'DiffHash', 'Box');
RankSimilarity(watch_fp, filenames, fp_collection, 4)