function pactImage = pact(image, pcaLoadings, columnMeans)
centristImage = centrist(image);
pactImage = pcaLoadings' * (centristImage-columnMeans)';
pactImage = pactImage(1:40,:)';
end
