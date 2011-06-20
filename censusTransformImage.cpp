#include "mex.h"

// FIXME: use a proper fixed size type
typedef unsigned char uint8;

inline size_t arrayAddress(size_t x, size_t y, size_t height)
{
  return x*height + y;
}

inline uint8 censusTransform(const uint8* image,
                             size_t x,
                             size_t y,
                             size_t height)
{
  uint8 ctValue = 0;
  const uint8 center = image[arrayAddress(x, y, height)];
  const mwSize neighbours[8] = {
    arrayAddress(x-1, y-1, height),
    arrayAddress(x  , y-1, height),
    arrayAddress(x+1, y-1, height),
    arrayAddress(x-1, y  , height),
    arrayAddress(x+1, y  , height),
    arrayAddress(x-1, y+1, height),
    arrayAddress(x  , y+1, height),
    arrayAddress(x+1, y+1, height)
  };

  // Hello, -funroll-loops.
  for (size_t i=0; i<8; ++i)
    if (center >= image[neighbours[i]])
      ctValue |= (0x01 << i);

  return ctValue;
}

void censusTransformImage(const mxArray* image, mxArray* ctImage)
{
  const size_t height = mxGetM(image);
  const size_t width = mxGetN(image);
  const size_t ctHeight = mxGetM(ctImage);

  const uint8* imageData = static_cast<uint8*>(mxGetData(image));
  uint8* ctImageData = static_cast<uint8*>(mxGetData(ctImage));

  for (size_t x=1; x<width-1; ++x)
    for (size_t y=1; y<height-1; ++y)
      ctImageData[arrayAddress(x-1, y-1, ctHeight)] =
        censusTransform(imageData, x, y, height);
}

void mexFunction(int nlhs,
                 mxArray *plhs[],
                 int nrhs,
                 const mxArray* prhs[])
{
  if (nrhs!=1)
    mexErrMsgIdAndTxt("censusTransformImage:nrhs","One input required.");

  const mxArray* image = prhs[0];

  if (!mxIsUint8(image))
    mexErrMsgIdAndTxt("censusTransformImage:notUint8","Image must be a uint8 array.");

  if (mxGetM(image)<3 || mxGetN(image)<3)
    mexErrMsgIdAndTxt("censusTransformImage:imageTooSmall","Image must be at least 3x3.");

  const mwSize nRows = mxGetM(image);
  const mwSize nCols = mxGetN(image);

  plhs[0] = mxCreateNumericMatrix(nRows-2, nCols-2, mxUINT8_CLASS, mxREAL);
  mxArray* ctImage = plhs[0];

  censusTransformImage(image, ctImage);
}
