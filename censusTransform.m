function censusTransformValue = censusTransform(image, x, y)

censusTransformValue = uint8(0);
center = image(y, x);

if center >= image(y-1, x-1)
  censusTransformValue = bitset(censusTransformValue, 1);
end
if center >= image(y-1, x)
  censusTransformValue = bitset(censusTransformValue, 2);
end
if center >= image(y-1, x+1)
  censusTransformValue = bitset(censusTransformValue, 3);
end
if center >= image(y, x-1)
  censusTransformValue = bitset(censusTransformValue, 4);
end
if center >= image(y, x+1)
  censusTransformValue = bitset(censusTransformValue, 5);
end
if center >= image(y+1, x-1)
  censusTransformValue = bitset(censusTransformValue, 6);
end
if center >= image(y+1, x)
  censusTransformValue = bitset(censusTransformValue, 7);
end
if center >= image(y+1, x+1)
  censusTransformValue = bitset(censusTransformValue, 8);
end

end
