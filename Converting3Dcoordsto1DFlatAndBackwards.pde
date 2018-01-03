/*----------------------------------------------------------------------
|>>> Functions map3Dto2D and map2Dto3D
+-----------------------------------------------------------------------
| Description: These functions allow for a 3D dataset to be stored as a 
|              1D array versus a 3D array (also known as 'flattening' a
|              multidimensional array). This is done with two defined
|              functions: one of which turns a 1D coordinate into its 3D
|              representation, the other of which turns a 3D coordinate 
|              into its 1D array index. The 3D array is assumed to be in
|              Row-Major Order followed by the 3rd coordinate such that
|              the first coordinate 'x' corresponds to the row, the 2nd
|              coordinate 'y' correponds to the column, and the third
|              coordinate 'z' corresponds to the 3rd dimension variable.
|
| Note:        Both functions need the number of rows and columns as
|              input, and the value 'z' in map3Dto1D could be improved
|              to check that it is less than or equal to numLevels i.e.
|              the cardinality of the 3rd dimension per row/col pair.
|
| Author:      Steven Eiselen, University of Arizona
|
| Resources:   This is a basic enough algorithm that it's effectively in
|              'the public domain'; though several versions of it exist
|              and can be trivially found via searching on the web for
|              terms such as 'flatten/unflatten 3D array', '3D array to
|              1D array coordinates', etc.
|
| Version:     1/3/18 Prep for GitHub public posting. As this code was
|              originally written to be implemented in JavaScript, there
|              will likely be no further updates made to it.
----------------------------------------------------------------------*/
int numLevels = 5;
int numRows   = 14;
int numCols   = 11;

void setup(){
  // Simple test to make sure it works ok
  println(map1Dto3D(532,14,11));
  println(map3Dto1D(3,6,4,14,11));
} // Ends Function setup

void draw(){
 // noneed
} // Ends Function draw

// Function that maps a 3D coordinate as described above into 1D
int map3Dto1D(int x, int y, int z, int nR, int nC){
  return (x*nR*nC)+(y*nC)+z;
} // Ends Function map3Dto1D

// Function that maps a 1D coordinate as described above into 3D
int[] map1Dto3D(int v, int nR, int nC){
  int[] ret = {-1,-1,-1};  
  ret[0] = v/(nR*nC);  
  ret[1] = (v%(nR*nC))/(nC); 
  ret[2] = v%(nC);
  return ret;
} // Ends Function map1Dto3D