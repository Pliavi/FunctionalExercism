-module(hello_world).

-import(io,[fwrite/1]).
-export([hello/0, test_version/0]).

hello() -> "Hello, World!".
