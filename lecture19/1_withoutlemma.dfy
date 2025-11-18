function More(x: int): int {
    if x <= 0 then 1 else More(x - 2) + 3
}


method ExampleLemmaUse(a: int) {
    var b := More(a);
    var c := More(b);
    assert 2 <= c - a;
}
