method Quadruple(x: int) returns (r: int) {
  var y := 3 * x;
  r := x + y;

  assert r == 10 * x;
  assert r < 5;
  assert false;
}
