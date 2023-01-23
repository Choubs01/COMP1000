int nZeroSubArrays(int[][] arr){
  int result = 0;
  for(int i = 0; i < arr.length; i++){
    int count = 0;
    if (arr[i].length == 0){
      result ++;}
    for(int o = 0; o < arr[i].length; o++){
      if(arr[i][o] == 0){
        count ++;}
    if(count == arr[i].length){
    result ++;}
    }
  }
  return result;
}

void setup(){
  int[][] example = {{0, 0}, {0, 2, 0, 5, 7}, {-5, 0, 1}, {0, 0, 0, 0, 0, 0, 0}, {}, {0}, {0,0}, {0,0,1,0}};
  print(nZeroSubArrays(example));}
