method PreVsPost(x: int) returns (r: int)
	requires x > 0
	ensures r > 0
{
	r := x;
}
