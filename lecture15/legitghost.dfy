ghost predicate IsEven(x: int)
{
	x % 2 == 0
}


method MultiplyByTwo(x: int) returns (r: int)
{
	r := x * 2;

	assert IsEven(r);
}

