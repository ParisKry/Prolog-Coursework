lunion([],List,List).
lunion([H|T],List1,[H|List2]):-
	not(member(H,List1)),
	!,
	lunion(T,List1,List2).
lunion([_|T],List1,List2):-
	lunion(T,List1,List2).


reduce(_,[X],X).
reduce(Operation, [H1,H2|T], Result):-
	Predicate =.. [Operation,H1,H2,Temp],
	call(Predicate),
	reduce(Operation,[Temp|T],Result),
	!.