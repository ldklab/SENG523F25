function Reduce(m: nat, x: int): int {
  if m == 0 then x else Reduce(m / 2, x + 1) - m
}

lemma {:induction false} ReduceLowerBound(m: nat, x: int)
	ensures x - 2 * m <= Reduce(m, x)
{
	if m == 0 {
	  assert Reduce(0,x) == x;
	}
	else {
		calc {
			  Reduce(m, x);
			==
				Reduce(m / 2, x + 1) - m;
			>= { ReduceLowerBound(m / 2, x + 1);
			    assert x + 1 - 2 * (m / 2) <= Reduce(m / 2, x + 1); }
				x + 1 - 2 * (m / 2) - m;
			>= { assert 2 * (m / 2) <= m; }
		    x + 1 - m - m;
			>
		    x - 2 * m;
		}
	}
}

