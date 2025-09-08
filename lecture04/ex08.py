def f(xs):
    for x in xs:
        if x > 0:
            return x
        break
    else:
        return -1
