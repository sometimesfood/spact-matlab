function censusTransformDirectory(inputDir, outputDir)
imageList = dir(fullfile(inputDir, '*.jpg'));
for i = 1:length(imageList)
  filename = imageList(i).name;
  inputFile = fullfile(inputDir, filename);
  image = imread(inputFile);
  ctImage = censusTransformImage(image);
  outputFile = fullfile(outputDir, strrep(filename, '.jpg', '.png'));
  imwrite(ctImage, outputFile, 'PNG');
end
end
