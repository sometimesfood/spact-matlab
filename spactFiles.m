function histograms = spactFiles(fileList, pcaLoadings, columnMeans)
histograms = cell(length(fileList), 1);
for i = 1:length(fileList)
  filename = fileList{i};
  histograms{i} = spact(imread(filename), pcaLoadings, columnMeans);
end
histograms = cell2mat(histograms);
end
