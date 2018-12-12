x : int = 0
y : int = 5
z : Foo = None
class Foo(object):
    x : int = 3
def foo(x : int) -> int:
    y : str = "test"
    def foo2() -> str:
        nonlocal y
        return y
    nonlocal x
    return x
x = 1 and 2
foo(y, 5)