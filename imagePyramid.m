function subimages = imagePyramid(I, level)
  function [borders, blockHeight, blockWidth] = pyramidBorders(I, level)
    [height, width] = size(I);

    if level == 0
      borders = [1, 1, height, width];
      blockHeight = height;
      blockWidth = width;
      return
    end

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
  end

[imageBorders, blockHeight, blockWidth] = pyramidBorders(I, level);
[nSubimages, ~] = size(imageBorders);
subimages = repmat(zeros(blockHeight, blockWidth, class(I)), [1 1 nSubimages]);

for i = 1:nSubimages
  top = imageBorders(i, 1);
  left = imageBorders(i, 2);
  subimages(:, :, i) = I(top:top+blockHeight-1, ...
                         left:left+blockWidth-1);
end
end
