-module(my_lists).
-export([listLength/1, minOfList/1, maxOfList/1, limitsOfList/1]).

listLength([]) -> 0;
listLength([_|Tail]) -> 1 + listLength(Tail).

minOfList([Head|Tail]) -> minOfList(Tail,Head).
minOfList([], A) -> A;
minOfList([Head|Tail], A) when Head < A -> minOfList(Tail, Head);
minOfList([Head|Tail], A) when Head > A -> minOfList(Tail, A).

maxOfList([Head|Tail]) -> maxOfList(Tail,Head).
maxOfList([], A) -> A;
maxOfList([Head|Tail], A) when Head > A -> maxOfList(Tail, Head);
maxOfList([Head|Tail], A) when Head < A -> maxOfList(Tail, A).

limitsOfList(List) -> {minOfList(List), maxOfList(List)}.

limitsOfList2([Head|Tail]) -> limitsOfList2(Tail, Head, Head).
limitsOfList2([Head|Tail], Min, Max) when -> 
