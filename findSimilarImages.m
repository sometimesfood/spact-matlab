function filelist = findSimilarImages(image, directory, nImages)
if ~exist('directory', 'var')
  directory = 'images/samples';
end

if ~exist('nImages', 'var')
  nImages = 10;
end

load(fullfile(directory, 'cache/spactDatabase.mat'));
spactImage = spact(image, pcaLoadings, columnMeans);
[~, indexes] = similarItems(spactImage, spactDatabase);
filelist = { filenames{indexes} }';
filelist = filelist(1:nImages);
end
