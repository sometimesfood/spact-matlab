function formats = supportedImageFormats
supportedFormats = imformats;
supportedFormats = flatten({ supportedFormats.ext });
formats = cellfun(@(x) ['*.' x ';'], supportedFormats, ...
                  'UniformOutput', false);
formats = cell2mat(formats);
end
