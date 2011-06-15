function histograms = imhistDirectory(directory)
imageList = dir(fullfile(directory, '*.png'));
histograms = zeros(length(imageList), 256);
for i = 1:length(imageList)
  image = imread(fullfile(directory, imageList(i).name));
  histograms(i, :) = imhist(image);
end
end
