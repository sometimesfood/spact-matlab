function histograms = spactDirectory(inputDir, pcaLoadings, columnMeans)
imageList = dir(fullfile(inputDir, '*.jpg'));
histograms = cell(length(imageList), 1);
for i = 1:length(imageList)
  filename = imageList(i).name;
  inputFile = fullfile(inputDir, filename);
  ctImage = cachedCensusTransformImage(inputFile);
  histograms{i} = spact(ctImage, pcaLoadings, columnMeans, true);
end
histograms = cell2mat(histograms);
end
