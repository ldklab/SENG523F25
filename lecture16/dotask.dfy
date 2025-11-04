method RequiredTaskTime(t: int) returns (v: nat)
	ensures v >= 0
{
	var x: nat :| true;
	v := x;
}


method DoTask(t: nat, h: nat)
  decreases t, h
{
  if h != 0 {
    // Work on the task for one hour, then continue:
    DoTask(t, h - 1);
  } else if t == 0 {
    // No more tasks to do!
  } else {
    // find out how much time is needed for the next task
    var hours := RequiredTaskTime(t - 1);
    // get started with task n-1:
    DoTask(t - 1, hours);
  }
}
