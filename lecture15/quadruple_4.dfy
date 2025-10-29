method Quadruple(x: int) returns (r: int) {
  if x == 0 {
    r := 0;
  } else {
    var y := 3 * x;
    r := x + y;
  }
  assert r == 4 * x;
}
