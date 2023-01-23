void makeAbsolute(int[][] a){
  for(int i = 0; i < a.length; i++){
    for(int j = 0; j < a[i].length; j++){
      a[i][j] = abs(a[i][j]);}}}


void setup() {
  int[][] arr = { {3, -4}, {-7}, {5, -6, -1} };
  makeAbsolute(arr); 
  //arr should become  { {3, 4}, {7}, {5, 6, 1} }
  for (int i=0; i < arr.length; i++) {
     for (int k=0; k < arr[i].length; k++) {
       print (arr[i][k]+" ");
     }
     println();
  }
}
