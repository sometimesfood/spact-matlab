function spactImage = spact(image, pcaLoadings, columnMeans, imageIsCt)
if ~exist('imageIsCt', 'var')
  imageIsCt = false;
end

if imageIsCt
  ctImage = image;
else
  ctImage = censusTransformImage(image);
end

level0 = imagePyramid(ctImage, 0);
level1 = imagePyramid(ctImage, 1);
level2 = imagePyramid(ctImage, 2);
pyramid = { level0, level1, level2 };

nPactImages = length(level0) + length(level1) + length(level2);
pactImages = cell(1, nPactImages);

imageNo = 1;
for i=1:length(pyramid)
  for j=1:length(pyramid{i})
    pactImages{imageNo} = pact(pyramid{i}{j}, ...
                               pcaLoadings, ...
                               columnMeans, ...
                               true);
    imageNo = imageNo + 1;
  end
end

spactImage = cell2mat(pactImages);

end
