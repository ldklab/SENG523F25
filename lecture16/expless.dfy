function ExpLess1(n: nat): nat
{
  if n == 0 then 0 else ExpLess2(n) + 1
}

function ExpLess2(n: nat): nat
  requires 1 <= n
{
  2 * ExpLess1(n - 1)
}
