function censusTransformHistogram = centrist(image, imageIsCt)
if(~exist('imageIsCt', 'var'))
  imageIsCt = false;
end

if (imageIsCt)
  % image is already census transformed
  ctImage = image;
else
  % image is not yet census transformed
  ctImage = censusTransformImage(image);
end

censusTransformHistogram = imhist(ctImage)';
end
