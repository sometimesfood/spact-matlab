function centristDatabase = saveCentristDatabase(directory)
centristDatabase = centristDirectory(directory);
save(fullfile(directory, 'cache', 'centristDatabase.mat'),...
     'centristDatabase');
end
