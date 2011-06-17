function spactImage = spact(image, pcaLoadings, columnMeans)
level1 = imagePyramid(image, 1);
level2 = imagePyramid(image, 2);
pyramid = { level1, level2 };

nPactImages = 1 + 5 + 25;
pactImages = cell(1, nPactImages);
pactImages{1} = pact(image, pcaLoadings, columnMeans);
imageNo = 2;

for i=1:length(pyramid)
  [~, ~, nSubimages] = size(pyramid{i});
  for j=1:nSubimages
    pactImages{imageNo} = pact(pyramid{i}(:,:,j), pcaLoadings, columnMeans);
    imageNo = imageNo + 1;
  end
end

spactImage = cell2mat(pactImages);

end
