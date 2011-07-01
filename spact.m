function spactImage = spact(image, pcaLoadings, columnMeans)

pyramid = imagePyramid(image, 2);
pactImages = cell(1, length(pyramid));

imageNo = 1;
for i=1:length(pyramid)
  pactImages{imageNo} = pact(pyramid{i}, ...
                             pcaLoadings, ...
                             columnMeans);
  imageNo = imageNo + 1;
end

spactImage = cell2mat(pactImages);

end
