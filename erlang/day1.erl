-module(day1).
-export([num_words/1]).
-export([to_ten/0]).
-export([range/2]).
-export([range/1]).
-export([succeed/1]).

num_words("") -> 0;
num_words(String) -> string:words(String).

range(Num) -> range(0, Num).
range(Num, Num) -> done;
range(Start, End) -> 
	io:fwrite("~w~n", [Start]),
	range(Start + 1, End).

to_ten() -> range(1, 11).

succeed(success) ->
	io:fwrite("success~n");
succeed({error, Message}) ->
	io:fwrite("error:~s ~n", [Message]).
