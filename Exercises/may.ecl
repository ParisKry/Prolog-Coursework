


model(Question):-
	term_variables(Question,Vars),
	check_for_values(Vars),
	Question.


theory(Question):-
	term_variables(Question,Vars),
	check_for_values(Vars),
	check_for_truth(Question).

%%OR alternatively
%%theory([]).
%%theory([Axiom|Rest]):-
%%	model(Axiom),
%%	theory(Rest).
%%	(no need for check_for_truth)


check_for_values([]).
check_for_values([t|T]):-
	%%H = t,
	check_for_values(T).
check_for_values([f|T]):-
	%%H = f,
	check_for_values(T).


%%OR alternatively
%%check_for_values([H|T]):-
%%	member(H,[t,f]),
%%	check_for_values(T).

check_for_truth([]).
check_for_truth([H|T]):-
	H,
	check_for_truth(T).

%%setof(X,theory([Y,Y==>X or Y,X or Y==>Y]),[t,f]).










transitions(s1,s2,10).
transitions(s1,s3,20).
transitions(s1,s6,50).
transitions(s2,s3,10).
transitions(s2,s4,20).
transitions(s3,s4,10).
transitions(s3,s5,20).
transitions(s4,s5,10).
transitions(s4,s6,20).
transitions(s5,s6,10).




coins_to_insert(FinalState,FinalState,[]).

coins_to_insert(InitialState,FinalState,[Change|Coins]):-
	transitions(InitialState,NextState,Change),
	coins_to_insert(NextState,FinalState,Coins).


run(N):-
	findall(List,coins_to_insert(s1,s6,List),Alts),
	length(Alts,N).






connection(rb1,i1,b2).
connection(i1,rb1,b2).
connection(rb1,i1,b3).
connection(i1,rb1,b3).
connection(rb1,i2,b4).
connection(i2,rb1,b4).
connection(i1,rb2,b5).
connection(rb2,i1,b5).
connection(i1,rb2,b6).
connection(rb2,i1,b6).
connection(i1,i2,b1).
connection(i2,i1,b1).
connection(i2,rb2,b7).
connection(rb2,i2,b7).


walk(Start,Finish,Path):-
	walk(Start,Finish,[],Path).

walk(Place,Finish,_,Step):-
	connection(Place,Finish,Step).

walk(Start,Finish,Visited,[Step|Path]):-
	connection(Start,Next,Step),
	not(member(Step,Visited)),
	walk(Next,Finish,[Step|Visited],Path).
















