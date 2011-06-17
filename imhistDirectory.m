function histograms = imhistDirectory(directory)
imageList = dir(fullfile(directory, '*.png'));
histograms = zeros(length(imageList), 254);
for i = 1:length(imageList)
  image = imread(fullfile(directory, imageList(i).name));
  histograms(i, :) = centrist(image, true);
end
end
