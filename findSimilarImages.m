function filelist = findSimilarImages(image, directory, nImages)

if ~exist('directory', 'var') || isempty(directory)
  directory = 'images/samples';
end

if ~exist('nImages', 'var')
  nImages = 10;
end

% create database if it does not exist
dbFilePath = fullfile(directory, 'cache/spactDatabase.mat');
if ~exist(dbFilePath, 'file')
  updateDatabase(directory);
end

load(dbFilePath);
spactImage = spact(image, pcaLoadings, columnMeans);
[~, indexes] = similarItems(spactImage, spactDatabase);
filelist = { filenames{indexes} }';
filelist = filelist(1:nImages);
end
