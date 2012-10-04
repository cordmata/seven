myreverse([], []).
myreverse([Head|Tail], List) :- myreverse(Tail, NewList), append(NewList, [Head], List).

mysmall([Num], Num).
mysmall([Head|Tail], Num) :- mysmall(Tail, NewNum),  NewNum < Head, Num is NewNum.
mysmall([Head|Tail], Num) :- mysmall(Tail, NewNum),  NewNum >= Head, Num is Head.
