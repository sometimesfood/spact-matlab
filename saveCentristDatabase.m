function centristDatabase = saveCentristDatabase(directory)
centristDatabase = imhistDirectory(directory);
save(fullfile(directory, 'centristDatabase.mat'),...
     'centristDatabase');
end
