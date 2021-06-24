
%%% and/3
%%% Definition of the and operation
and(0,1,0).
and(0,0,0).
and(1,0,0).
and(1,1,1).

%%% not/2
%%% definition of the not operation
not(1,0).
not(0,1).

%%% nand/3
nand(X,Y,Output):-
	and(X,Y,ANDResult),
	not(ANDResult,Output).

xorgate(0,1,1).
xorgate(0,0,0).
xorgate(1,0,1).
xorgate(1,1,0).

half_adder(X,Y,S,C):-
	xorgate(X,Y,S),
	and(X,Y,C).

