function Reduce(m: nat, x: int): int {
  if m == 0 then x else Reduce(m / 2, x + 1) - m
}

lemma {:induction false} ReduceUpperBound(m: nat, x: int)
	ensures Reduce(m, x) <= x
{
	if m == 0 {
	  assert Reduce(0,x) == x;
	}
	else {
		calc {
			  Reduce(m,x);
			==
				Reduce(m/2, x+1) - m;
			<= { ReduceUpperBound(m/2, x+1);
				assert Reduce(m/2, x+1) <= x+1; }
				x + 1 - m;
			<= {assert 0 < m;}
			  x;
		}
	}
}

