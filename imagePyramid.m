function borders = imagePyramid(image, level)
[height, width] = size(image);
if level == 0
  borders = [0, 0, height, width];
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

end
