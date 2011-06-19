function filelist = findSimilarImages(image, directory)
load(fullfile(directory, 'cache/spactDatabase.mat'));
spactImage = spact(image, pcaLoadings, columnMeans);
[~, indexes] = similarItems(spactImage, spactDatabase);
filelist = { filenames{indexes} }';
end