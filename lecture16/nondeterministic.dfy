method Squarish(x: int, guess: int) returns (y: int)
  ensures x * x == y
{
  if
  case guess == x * x =>
    y := guess;
  case true =>
    y := Squarish(x, guess - 1);
  case true =>
    y := Squarish(x, guess + 1);
}
