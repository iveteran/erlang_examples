-module(geometry).
-export([area/1, test/0]).

pi() -> 3.14159.

area({rectange, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> pi() * Radius * Radius.

test() ->
    12 = area({rectange, 3, 4}),
    144 = area({square, 12}),
    tests_worked.
