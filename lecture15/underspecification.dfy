method Index(n: int) returns (i: int)
  requires 1 <= n
  ensures 0 <= i < n
{
  i := 0;
}

method EqualityTest()
{
  var x := Index(50);
  var y := Index(50);

  assert x == y;
}

