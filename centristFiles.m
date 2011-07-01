function histograms = centristFiles(fileList)
histograms = cell(length(fileList), 1);
for i = 1:length(fileList)
  filename = fileList{i};
  histograms{i} = centrist(imread(filename));
end
histograms = cell2mat(histograms);
end
