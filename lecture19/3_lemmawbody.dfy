function More(x: int): int {
    if x <= 0 then 1 else More(x - 2) + 3
}

//lemma {:induction false} Increasing(x: int)
lemma Increasing(x: int)
  ensures x < More(x)
{

}

method ExampleLemmaUse(a: int) {
    var b := More(a);
    Increasing(a);
    Increasing(b);
    var c := More(b);
    assert 2 <= c - a;
}


method Main(args: seq<string>)
{
  var realArgs := args;
  if |realArgs| > 0 && realArgs[0] == "dotnet" {
    realArgs := realArgs[1..];
  }

  if |realArgs| < 1 {
    print "Usage: 0_more <x>\n";
    return;
  }

  var x := ParseInt(realArgs[0]);
  var r := More(x);
  print r, "\n";
}


method ParseInt(s: string) returns (n: int)
{
  var i := 0;
  var sign := 1;
  n := 0;

  if |s| == 0 {
    return;
  }

  if s[0] == '-' {
    sign := -1;
    i := 1;
  } else if s[0] == '+' {
    i := 1;
  }

  while i < |s|
  {
    var c := s[i] as int;
    var d := c - ('0' as int);

    if d < 0 || d > 9 {
      n := 0;
      return;
    }

    n := n * 10 + d;
    i := i + 1;
  }

  n := sign * n;
}
