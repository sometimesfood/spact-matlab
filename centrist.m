function censusTransformHistogram = centrist(image)
grayImage = imageToGray(image);
ctImage = censusTransformImage(grayImage);
censusTransformHistogram = imhist(ctImage)';
% drop first and last column in histogram
censusTransformHistogram = censusTransformHistogram(2:end-1);
end
