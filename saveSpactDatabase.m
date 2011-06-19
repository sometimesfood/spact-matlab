function [spactDatabase, pcaLoadings, columnMeans] = saveSpactDatabase(directory)
  function absoluteFilenames = imageList(directory)
    images = dir(fullfile(directory, '*.jpg'));
    absoluteFilenames = arrayfun(@(x) fullfile(directory, x.name), ...
                                 images, ...
                                 'UniformOutput', false);
  end
filenames = imageList(directory);
centristDatabase = centristFiles(filenames);
columnMeans = mean(centristDatabase);
pcaLoadings = princomp(centristDatabase);
spactDatabase = spactFiles(filenames, pcaLoadings, columnMeans);
cacheDir = fullfile(directory, 'cache');
save(fullfile(cacheDir, 'centristDatabase.mat'), 'centristDatabase');
save(fullfile(cacheDir, 'spactDatabase.mat'), ...
     'spactDatabase', ...
     'pcaLoadings', ...
     'columnMeans');
end
