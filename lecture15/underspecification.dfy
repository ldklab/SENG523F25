method MinusOne(n: int) returns (i: int)
  requires 1 <= n
  ensures 0 <= i < n
{
  i := 0;
}

method EqualityTest()
{
  var x := MinusOne(50);
  var y := MinusOne(50);

  assert x == y;
}

