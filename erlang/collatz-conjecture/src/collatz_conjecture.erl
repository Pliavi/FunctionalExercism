-module(collatz_conjecture).

-export([steps/1, test_version/0]).

steps(N) when N > 0 -> get_number(N, 0);
steps(_) -> {error, "Only positive numbers are allowed"}.

get_number(1, Counter)                   -> Counter;
get_number(N, Counter) when N rem 2 == 0 -> get_number(N div 2, Counter + 1);
get_number(N, Counter)                   -> get_number(N * 3 + 1, Counter + 1).

test_version() -> 2.
