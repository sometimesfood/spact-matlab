function censusTransformedImage = censusTransformImage(image)
censusTransformedImage = zeros(size(image)-2, 'uint8');
[height, width] = size(image);
for x = 2:width-1
  for y = 2:height-1
    censusTransformedImage(y-1, x-1) = censusTransform(image, x, y);
  end
end
end
