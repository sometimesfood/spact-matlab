function histograms = spactFiles(fileList, pcaLoadings, columnMeans)
histograms = cell(length(fileList), 1);
for i = 1:length(fileList)
  filename = fileList{i};
  ctImage = cachedCensusTransformImage(filename);
  histograms{i} = spact(ctImage, pcaLoadings, columnMeans, true);
end
histograms = cell2mat(histograms);
end
