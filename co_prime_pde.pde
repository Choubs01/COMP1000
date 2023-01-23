boolean is_coprime(int x, int y){
  int z = 0;
  if (x > y){
     z = x;}
  if (y > x){
     z = y;}
 
  while (z > 1){
    if (x%z == 0 && y%z ==0){
      return false;}
    z = z-1;    }
  return true;
}

void setup(){
  println(is_coprime(24, 125));
  println(is_coprime(42, 77));
}
