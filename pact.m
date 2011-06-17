function pactImage = pact(image, pcaLoadings, columnMeans, imageIsCt)
if(~exist('imageIsCt', 'var'))
  imageIsCt = false;
end

centristImage = centrist(image, imageIsCt);
pactImage = pcaLoadings' * (centristImage-columnMeans)';
pactImage = pactImage(1:40,:)';
end
