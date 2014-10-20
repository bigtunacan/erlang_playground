-module(recursive).
-export([tail_zip/2,lenient_zip/2,zip/2,tail_sublist/2,sublist/2,tail_reverse/1,fac/1,len/1,tail_fac/1,tail_len/1,tail_duplicate/2]).

fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

len([]) -> 0;
len([_|T]) -> 1 + len(T).

tail_len(L) -> tail_len(L,0).

tail_len([], Acc) -> Acc;
tail_len([_|T], Acc) -> tail_len(T,Acc+1).

tail_fac(N) -> tail_fac(N,1).

tail_fac(0,Acc) -> Acc;
tail_fac(N,Acc) when N > 0 -> tail_fac(N-1, N*Acc).

tail_duplicate(N, Term) ->
  tail_duplicate(N,Term,[]).

tail_duplicate(0,_,List) -> List;
tail_duplicate(N,Term,List) when N > 0 ->
  tail_duplicate(N-1, Term, [Term|List]).

tail_reverse(L) -> tail_reverse(L,[]).

tail_reverse([],Acc) -> Acc;
tail_reverse([H|T],Acc) -> tail_reverse(T, [H|Acc]).

sublist(_,0) -> [];
sublist([],_) -> [];
sublist([H|T],N) when N > 0 -> [H|sublist(T,N-1)].

tail_sublist(L, N) -> lists:reverse(tail_sublist(L, N, [])).

tail_sublist(_, 0, SubList) -> SubList;
tail_sublist([], _, SubList) -> SubList;
tail_sublist([H|T], N, SubList) when N > 0 ->
  tail_sublist(T, N-1, [H|SubList]).

zip([],[]) -> [];
zip([X|Xs],[Y|Ys]) -> [{X,Y}|zip(Xs,Ys)].

tail_zip(X, Y) -> lists:reverse(tail_zip(X, Y, [])).

tail_zip([],[],Acc) -> Acc;
tail_zip([X|Xs],[Y|Ys],Acc) ->
  tail_zip(Xs,Ys, [{X,Y}|Acc]).

lenient_zip([],_) -> [];
lenient_zip(_,[]) -> [];
lenient_zip([X|Xs],[Y|Ys]) -> [{X,Y}|lenient_zip(Xs,Ys)].
