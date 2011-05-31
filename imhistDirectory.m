function histograms = imhistDirectory(directory)
imageList = dir(fullfile(directory, '*.png'));
histograms = zeros(256, length(imageList));
for i = 1:length(imageList)
  image = imread(fullfile(directory, imageList(i).name));
  histograms(:, i) = imhist(image);
end
end
