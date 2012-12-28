-module(translate_service).
-export([translate/1, start/0, monitor/0]).

loop() ->
    receive
        {From, "casa"} ->
            From ! "house",
            loop();


        {From, "blanca"} ->
            From ! "white",
            loop();

        {From, _} ->
            From ! "I don't understand.",
            loop();

        "die" ->
            io:format("Translator loop died.~n"),
            exit(self(), normal)
    end.


translate(Word) ->
    case Word of
        "die" -> translator ! Word;
        _ -> translator ! {self(), Word}
    end,
    receive
        Translation -> Translation
    end.

monitor() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Starting translator service.~n"),
            register(translator, spawn_link(fun loop/0)),
            monitor();
        {'EXIT', From, Reason} ->
            io:format("Process ~p died with reason ~p.", [From, Reason]),
            self() ! new,
            monitor()
    end.

start() ->
    Mon = spawn(fun monitor/0),
    Mon ! new,
    Mon.
