function ExpLess1(n: nat): nat
	decreases n, 1
{
  if n == 0 then 0 else ExpLess2(n) + 1
}

function ExpLess2(n: nat): nat
  requires 1 <= n
	decreases n, 0
{
  2 * ExpLess1(n - 1)
}
