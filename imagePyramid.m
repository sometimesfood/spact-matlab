function subimages = imagePyramid(I, level)
  function subimages = splitImage(I, level)
    [height, width] = size(I);

    nBlocks = 2^level;
    blockWidth = floor(width/nBlocks);
    blockHeight = floor(height/nBlocks);
    nOverlappingBlocks = nBlocks-1;
    nBlocksTotal = nBlocks^2 + nOverlappingBlocks^2;
    borders = repmat([0 0], nBlocksTotal, 1);

    for x=1:nBlocks
      for y=1:nBlocks
        blockNumber = (y-1)*nBlocks + x;
        borders(blockNumber, 1) = blockHeight*(y-1)+1;
        borders(blockNumber, 2) = blockWidth*(x-1)+1;
      end
    end

    for x=1:nOverlappingBlocks
      for y=1:nOverlappingBlocks
        blockNumber = (nBlocks^2) + (y-1)*nOverlappingBlocks + x;
        borders(blockNumber, 1) = floor(blockHeight/2) + blockHeight*(y-1)+1;
        borders(blockNumber, 2) = floor(blockWidth/2) + blockWidth*(x-1)+1;
      end
    end

    [nSubimages, ~] = size(borders);
    subimages = cell(nSubimages, 1);
    for i = 1:nSubimages
      top = borders(i, 1);
      left = borders(i, 2);
      subimages{i} = I(top:top+blockHeight-1, ...
                       left:left+blockWidth-1);
    end
  end

splitImages = cell(level+1, 1);
for l=0:level
  scaledImage = imresize(I, 1/2^(level-l));
  splitImages{l+1} = splitImage(scaledImage, l);
end

subimages = vertcat(splitImages{:});
end
