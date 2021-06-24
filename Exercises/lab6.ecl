proper_set_s(List):-
	proper_set_s_aux(List,List).

proper_set_s_aux(List, ExtraList):-
	setof(X,member(X,List),ExtraList).



:-op(450,yfx,and).
:-op(500,yfx,or).
:-op(400,fy,--).
:-op(600,xfx,==>).
:-op(500,yfx,xor).
:-op(500,yfx,nor).
:-op(450,yfx,nand).


Arg1 and Arg2:-
	Arg1,Arg2.

Arg1 or _Arg2:-
	Arg1.
_Arg1 or Arg2:-
	Arg2.

--Arg:-
	not(Arg).

Arg1 ==> Arg2:-
	Arg1 or --Arg2.

Arg1 xor Arg2:-
	Arg1,--Arg2.
Arg1 xor Arg2:-
	--Arg1,Arg2.

Arg1 nor Arg2:-
	--(Arg1 or Arg2).

Arg1 nand Arg2:-
	--(Arg1 and Arg2).



t.
f:-!,fail.




model(Question):-
	term_variables(Question,Vars),
	check_for_values(Vars),
	Question.


theory(Question):-
	term_variables(Question,Vars),
	check_for_values(Vars),
	check_for_truth(Question).


check_for_values([]).
check_for_values([H|T]):-
	H = t,
	check_for_values(T).
check_for_values([H|T]):-
	H = f,
	check_for_values(T).

check_for_truth([]).
check_for_truth([H|T]):-
	H,
	check_for_truth(T).




