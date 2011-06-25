function grayImage = imageToGray(image)
if ndims(image) == 2
  grayImage = image;
else
  grayImage = rgb2gray(image);
end
end
