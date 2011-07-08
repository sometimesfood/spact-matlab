function censusTransformedImage = censusTransformImage(image)
%y-1 x-1
censusTransformedImage=(image(2:end-1,2:end-1)>=image(1:end-2,1:end-2));
%y-1 x
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(1:end-2,2:end-1))*2;
%y-1 x+1
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(1:end-2,3:end))*4;
%y x-1
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(2:end-1,1:end-2))*8;
%y x+1
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(2:end-1,3:end))*16;
%y+1 x-1
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(3:end,1:end-2))*32;
%y+1 x
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(3:end,2:end-1))*64;
%y+1 x+1
censusTransformedImage=censusTransformedImage+(image(2:end-1,2:end-1)>=image(3:end,3:end))*128;
censusTransformedImage=uint8(censusTransformedImage);
end
