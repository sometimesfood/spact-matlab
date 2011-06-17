function spactImage = spact(image, pcaLoadings, columnMeans)
ctImage = censusTransformImage(image);

level1 = imagePyramid(ctImage, 1);
level2 = imagePyramid(ctImage, 2);
pyramid = { level1, level2 };

nPactImages = 1 + 5 + 25;
pactImages = cell(1, nPactImages);
pactImages{1} = pact(ctImage, pcaLoadings, columnMeans, true);
imageNo = 2;

for i=1:length(pyramid)
  [~, ~, nSubimages] = size(pyramid{i});
  for j=1:nSubimages
    pactImages{imageNo} = pact(pyramid{i}(:,:,j), ...
                               pcaLoadings, ...
                               columnMeans, ...
                               true);
    imageNo = imageNo + 1;
  end
end

spactImage = cell2mat(pactImages);

end
