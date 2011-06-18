function [spactDatabase, pcaLoadings, columnMeans] = saveSpactDatabase(directory)
centristDatabase = centristDirectory(directory);
columnMeans = mean(centristDatabase);
pcaLoadings = princomp(centristDatabase);
spactDatabase = spactDirectory(directory, pcaLoadings, columnMeans);
cacheDir = fullfile(directory, 'cache');
save(fullfile(cacheDir, 'centristDatabase.mat'), 'centristDatabase');
save(fullfile(cacheDir, 'spactDatabase.mat'), ...
     'spactDatabase', ...
     'pcaLoadings', ...
     'columnMeans');
end
