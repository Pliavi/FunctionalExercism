-module(accumulate).

-export([accumulate/2, test_version/0]).

accumulate(Fn, [ Fst | Ls]) -> [ Fn(Fst) | accumulate(Fn, Ls) ];
accumulate(_,Lst) -> Lst.

test_version() -> 1.
