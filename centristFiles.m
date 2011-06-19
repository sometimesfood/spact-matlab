function histograms = centristFiles(fileList)
histograms = cell(length(fileList), 1);
for i = 1:length(fileList)
  filename = fileList{i};
  ctImage = cachedCensusTransformImage(filename);
  histograms{i} = centrist(ctImage, true);
end
histograms = cell2mat(histograms);
end
