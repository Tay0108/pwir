-module(zad1).
-compile([export_all]).

get_random() ->
  rand:uniform(5000)+100.

f5loop(N) ->
  receive
    {Producent, wyslij} ->
      Producent!{get_random(), test},
      if N > 0  -> f5loop(N-1);
    {_,koniec} ->
      io:format("Wyslano wszystko ~n")
  end.

producent() ->
    receive
        {Losowa,test} ->
        io:format("Producent PID: ~p ~n", [self()]),
        Posrednik = spawn(zad1,posrednik,[]),
        Posrednik!{Losowa, wzorzec}
    end.

posrednik() ->
    receive
        {Losowa, wzorzec} ->
            io:format("Posrednik PID: ~p ~n", [self()]),
            Konsument = spawn(zad1,konsument,[]),
            Konsument!{Losowa,wzorzecb}
    end.

konsument() ->
    io:format("Konsument PID: ~p ~n", [self()]),
    receive
        {Losowa, wzorzecb} ->
            io:format("Losowa: ~p ~n",[Losowa])
    end.


fm() ->
    Petla = spawn(zad1, f5loop, [4]),
    Producent = spawn(zad1, producent, []),
    Petla!{Producent, wyslij}.
