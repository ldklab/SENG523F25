method Quadruple(x: int) returns (r: int)
ensures r == 4 * x
{
  var y := 3 * x;
  r := x + y;
}
