-module(day1).
-export([num_words/1]).
-export([to_ten/0]).
-export([succeed/1]).

num_words("") -> 0;
num_words(String) -> string:words(String).

to_ten() -> to_ten(1).
to_ten(11) -> done;
to_ten(Num) -> 
	io:fwrite("~w~n", [Num]),
	to_ten(Num + 1).

succeed(success) ->
	io:fwrite("success~n");
succeed({error, Message}) ->
	io:fwrite("error:~s ~n", [Message]).
