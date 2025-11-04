method RequiredTaskTime(t: int) returns (v: nat)
	ensures v >= 0
{
	var x: nat :| true;
	v := x;
}


method DoTask(t: nat)
  requires t <= 40
  decreases 40 - t
{
  if t == 40 {
    // done
  } else {
    var hours := RequiredTaskTime(t);
    Work(t, hours);
  }
}


method Work(t: nat, h: nat)
  requires t < 40
  decreases 40 - t, h
{
  if h == 0 {
    // done with task t
    DoTask(t + 1);
  } else {
    Work(t, h - 1);
  }
}
