-module(day2).
-export([lookup/2, item_cost/1, get_cart/0, get_artists/0,
		 total_cost/1, tic_tac/1]).

get_artists() -> [
	{dwight, "Turn Me Loose"},
	{steve, "Hardcore Trubadour"},
	{townes, "Pancho and Lefty"},
	{emmylou, "Two More Bottles of Wine"}
].

lookup(_, []) -> not_found;
lookup(Needle, [{Needle, Message}|_]) -> Message;
lookup(Needle, [_|Tail]) -> lookup(Needle, Tail).

get_cart() -> [
	{razor, 3, 4.50},
	{cheese, 2, 2.99},
	{apples, 7, 0.29},
	{wine, 2, 7.66}
].

item_cost(Cart) -> [{Product, Qty * Price} || {Product, Qty, Price} <- Cart].
total_cost(Cart) ->
	lists:foldl(fun({_, Icost}, Sum) -> Icost + Sum end, 0, item_cost(Cart)).

tic_tac(Board) ->
	case Board of
		[Win,Win,Win,_,_,_,_,_,_] when Win == "X"; Win == "O" -> Win;
		[_,_,_,Win,Win,Win,_,_,_] when Win == "X"; Win == "O" -> Win;
		[_,_,_,_,_,_,Win,Win,Win] when Win == "X"; Win == "O" -> Win;
		[Win,_,_,Win,_,_,Win,_,_] when Win == "X"; Win == "O" -> Win;
		[_,Win,_,_,Win,_,_,Win,_] when Win == "X"; Win == "O" -> Win;
		[_,_,Win,_,_,Win,_,_,Win] when Win == "X"; Win == "O" -> Win;
		[Win,_,_,_,Win,_,_,_,Win] when Win == "X"; Win == "O" -> Win;
		[_,_,Win,_,Win,_,Win,_,_] when Win == "X"; Win == "O" -> Win;
		_ -> case lists:any(fun(X) -> X == " " end, Board) of
			true -> no_winner;
			false -> cat
		end
	end.
