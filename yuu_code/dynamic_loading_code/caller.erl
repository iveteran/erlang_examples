-module(caller).
-compile(export_all).

start(Tag) ->
    spawn(fun() -> loop(Tag) end).

loop(Tag) ->
    sleep(),
    Val = callee:x(),
    io:format("Vsn3 (~p) callee:x() = ~p~n", [Tag, Val]),
    loop(Tag).

sleep() ->
    receive
        after 3000 -> true
    end.
