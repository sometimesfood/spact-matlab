function censusTransformedImage = centrist(image)
if ndims(image) == 2
  grayImage = image;
else
  grayImage = rgb2gray(image);
end
censusTransformedImage = zeros(size(grayImage)-2, 'uint8');
[height, width] = size(grayImage);
for x = 2:width-1
  for y = 2:height-1
    censusTransformedImage(y-1, x-1) = censusTransform(grayImage, x, y);
  end
end
end
