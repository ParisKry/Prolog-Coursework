count_odd([],0).
count_odd([H|T],Count):-
	1 is H mod 2,
	count_odd(T,CountTail),
	Count is CountTail+1.
count_odd([H|T],Count):-
	0 is H mod 2,
	count_odd(T,Count).

replace(X,Y,[X|T],[Y|T]):-
	X \= Y.
replace(X,Y,[H|T],[H|Z]):-
	replace(X,Y,T,Z).