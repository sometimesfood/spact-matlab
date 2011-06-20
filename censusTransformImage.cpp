#include "mex.h"

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

  if (!mxIsUint8(prhs[0]))
    mexErrMsgIdAndTxt("censusTransformImage:notUint8","Image must be a uint8 array.");

  if ((mxGetM(prhs[0])<3) || (mxGetN(prhs[0])<3))
    mexErrMsgIdAndTxt("censusTransformImage:imageTooSmall","Image must be at least 3x3.");

  const mwSize nrows = mxGetM(prhs[0]);
  const mwSize ncols = mxGetN(prhs[0]);

  plhs[0] = mxCreateNumericMatrix(nrows-2, ncols-2, mxUINT8_CLASS, mxREAL);

  censusTransformImage(prhs[0], plhs[0]);
}
