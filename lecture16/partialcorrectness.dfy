method PartialId(x: int) returns (y: int)
  ensures y == x
{
  if x % 2 == 0 {
    y := x;
  } else {
    y := PartialId(x);
  }
}
