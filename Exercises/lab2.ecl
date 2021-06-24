%%% divides/2
divides(X,X).
divides(X,Y):-
	X\=0,
	Y>X,
	Z is Y-X,
	divides(X,Z).

%%% divides/3
divides(X,X,1).
divides(X,Y,Div):-
	X\=0,
	Y>X,
	Z is Y-X,
	divides(X,Z,NDiv),
	Div is NDiv+1.


%%% int_in_range/3
int_in_range(Min,Max,Min):-
	Min=<Max.
int_in_range(Min,Max,X):-
	Max>Min,
	Y is Min+1,
	int_in_range(Y,Max,X).