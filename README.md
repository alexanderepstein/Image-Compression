# Image Compression

A small MATLAB script that compresses an image utilizing Singular Value Decomposition
It works on colored images by splitting the red, green and blue color channels into their own separate matrices

## How To Use
* First clone the repository
```bash
git clone https://github.com/alexanderepstein/Image-Compression
```
* Then copy these files over to your MATLAB root folder
* Open ImageTest.m and run it
###### To run this on your own image just add your image file to the root MATLAB folder and change the imagefile variable in ImageTest.m to the name of your file.
###### This script will take a long time to run, it was used just to display the rgbSVD.m script in a way that provides data about the percent error based on how many singular values are used.

# License
MIT License

Copyright (c) 2017 Alex Epstein

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
