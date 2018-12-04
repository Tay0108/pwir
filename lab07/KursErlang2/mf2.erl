%  mf2.erl
-module(mf2).
-compile([export_all]).

fp()->
  receive
    {Od,agh} -> Od!{agh,ok} % on otrzymuje tą wiadomość i dopasowuje ją do wzorca i zwraca odeslanie wiadomosc ok
  end.
  
fm()->
 FPid=spawn(mf2,fp,[]), % tworzy proces z modułu mf2, odpala w nim funkcję fp z argumentami [] (czyli bez argumentów).
 FPid!{self(),agh}.  % przeslanie wiadomosci do procesu FPid o treści {wlasne_pid, wzorzec} (krotka)
 
flen(L)->
io:format("flen: ~p ~n",[length(L)]).
  
fm2()->
 Lw=[1,2,3,4,5],
 spawn(mf2,flen,[Lw]).     	