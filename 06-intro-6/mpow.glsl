mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  // For example:
  //
  //  matrixPower(m, 2) = m * m
  //
  highp mat2 res = m;
  for (int i=1;i<16;i++){
    if (i<n) {
      res = res * m;
    }
  }

  return res;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
