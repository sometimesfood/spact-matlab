function censusTransformedImage = cachedCensusTransformImage(imagePath)

[dirPath, filename] = fileparts(imagePath);
cacheDir = fullfile(dirPath, 'cache');
cacheFilePath = fullfile(cacheDir, [filename '.png']);

if exist(cacheFilePath, 'file')
  % use cached image
  censusTransformedImage = imread(cacheFilePath);
else
  % image not yet in cache, do census transform
  image = imread(imagePath);
  censusTransformedImage = censusTransformImage(image);
  if ~exist(cacheDir, 'dir')
    % make sure there is a cache directory
    mkdir(cacheDir)
  end
  % save census transformed image for next time
  imwrite(censusTransformedImage, cacheFilePath, 'PNG');
end

end
