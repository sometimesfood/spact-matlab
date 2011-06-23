% Flatten a nested cell array, taken from
% http://groups.google.com/group/comp.soft-sys.matlab/browse_thread/thread/83e6ad0772bf68b8
function flatCell = flatten(cellArray)
flatCell{1} = []; %#ok<*AGROW>
for i=1:numel(cellArray)
  if iscell(cellArray{i})
    currentCell = flatten(cellArray{i});
    [flatCell{end+1:end+length(currentCell)}] = deal(currentCell{:});
  else
    flatCell{end+1} = cellArray{i};
  end
end
flatCell(1) = [];
end
