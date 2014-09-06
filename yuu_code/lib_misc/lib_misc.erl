-module(lib_misc).
-export([for/3, qsort/1, pythag/1, odds_and_evens1/1, odds_and_evens2/1, sqrt/1]).
%-export([count_chars/1]).

for (Max, Max, F) -> [F(Max)];
for (I, Max, F)  -> [F(I) | for(I+1, Max, F)].

qsort ([]) -> [];
qsort ([Pivot | T]) ->
        qsort([X || X <- T, X < Pivot])
        ++ [Pivot] ++
        qsort([X || X <- T, X >= Pivot]).

pythag(N) ->
    [ {A, B, C} ||
        A <- lists:seq(1, N),
        B <- lists:seq(1, N),
        C <- lists:seq(1, N),
        A + B + C =< N,
        A * A + B * B =:= C * C
    ].

sqrt(X) when X < 0 ->
    error({squareRootNegativeArgument, X});
sqrt(X) ->
    math:sqrt(X).

odds_and_evens1(L) ->
    Odds  = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.

odds_and_evens2(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H | T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H | Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H | Evens])
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.

%count_chars(Str) ->
%    count_chars(Str, #{}).
%
%count_chars([H | T], #{ H => N } = X) ->
%    count_chars(T, X#{ H := N + 1 });
%count_chars([H | T], X) ->
%    count_chars(T, X#{ H => 1 });
%count_chars([], X) ->
%    X.
