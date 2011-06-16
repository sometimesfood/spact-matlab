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
    borders = repmat([0 0 0 0], nBlocksTotal, 1);

    for x=1:nBlocks
      for y=1:nBlocks
        blockNumber = (y-1)*nBlocks + x;
        borders(blockNumber, 1) = blockHeight*(y-1)+1;
        borders(blockNumber, 2) = blockWidth*(x-1)+1;
        borders(blockNumber, 3) = borders(blockNumber, 1) + blockHeight - 1;
        borders(blockNumber, 4) = borders(blockNumber, 2) + blockWidth - 1;
      end
    end

    for x=1:nOverlappingBlocks
      for y=1:nOverlappingBlocks
        blockNumber = (nBlocks^2) + (y-1)*nOverlappingBlocks + x;
        borders(blockNumber, 1) = floor(blockHeight/2) + blockHeight*(y-1)+1;
        borders(blockNumber, 2) = floor(blockWidth/2) + blockWidth*(x-1)+1;
        borders(blockNumber, 3) = borders(blockNumber, 1) + blockHeight - 1;
        borders(blockNumber, 4) = borders(blockNumber, 2) + blockWidth - 1;
      end
    end
  end

[imageBorders, blockHeight, blockWidth] = pyramidBorders(I, level);
[nSubimages, ~] = size(imageBorders);
subimages = repmat(zeros(blockWidth, blockHeight), [1 1 nSubimages]);

image(I)
hold

for i = 1:nSubimages
%  subimages(:, :, i) = I(imageBorders(i, 1):imageBorders(i, 3), ...
%                         imageBorders(i, 2):imageBorders(i, 4));
  rectangle('Position', [imageBorders(i, 2),...
                         imageBorders(i, 1),...
                         imageBorders(i, 4)-imageBorders(i,2)+1,...
                         imageBorders(i, 3)-imageBorders(i,1)+1]);
end
end
