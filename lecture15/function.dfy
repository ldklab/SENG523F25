function Average(a: int, b: int): int {
  (a + b) / 2
}

method Quadruple(x: int) returns (r: int)
  	ensures Average(r, 4 * x) == 4 * x
{
  var y := 3 * x;
  r := x + y;
}
