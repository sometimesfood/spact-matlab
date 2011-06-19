function [distances, indexes] = similarItems(item, database)
[nItems, ~] = size(database);
items = cell(nItems, 1);

for i=1:nItems
  items{i} = euclideanDistance(item, database(i,:));
end

items = cell2mat(items);
[distances, indexes] = sort(items);
end
