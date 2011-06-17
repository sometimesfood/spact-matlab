function pactImage = pact(image, pcaLoadings, columnMeans, imageIsCt)
centristImage = centrist(image);
pactImage = pcaLoadings' * (centristImage(2:255)-columnMeans)';
pactImage = pactImage(1:40,:)';
end
