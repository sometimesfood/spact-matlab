function censusTransformDirectory(inputDir)
imageList = dir(fullfile(inputDir, '*.jpg'));
for i = 1:length(imageList)
  filename = imageList(i).name;
  inputFile = fullfile(inputDir, filename);
  cachedCensusTransformImage(inputFile);
end
end
