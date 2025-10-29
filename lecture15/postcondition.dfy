method Quadruple(x: int) returns (r: int)
requires x % 2 == 0
ensures r == 4 * x
{
  var y := x / 2;
  r := 8 * y;
}
