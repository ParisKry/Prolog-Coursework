

:-lib(ic).

:-lib(branch_and_bound).

:-lib(ic_global).

:-use_module(library(ic_edge_finder)).



%	EXERCISE 1


%	exams/2
%	For this specific problem, this predicate returns the list of start times for the five
%	exams (L) as well as the total amount of time needed for them all to be done (Duration).

exams(L, Duration):-
	Starts = [T1,T2,T3,T4,T5],
	Ends = [E1,E2,E3,E4,E5],
	Starts #:: 0..inf,
	Ends #:: 0..inf,
	E1 #= T1+15,
	E2 #= T2+18,
	E3 #= T3+23,
	E4 #= T4+13,
	E5 #= T5+21,
	disjunctive([T1,T3],[15,23]),
	cumulative(Starts,[15,18,23,13,21],[12,20,19,25,7],40),
	ic_global:maxlist(Ends,MakeSpan),
	bb_min(labeling(Starts),MakeSpan,bb_options{strategy:restart}),
	T11 #= 10 * T1,
	T12 #= 10 * T2,
	T13 #= 10 * T3,
	T14 #= 10 * T4,
	T15 #= 10 * T5,
	L = [T11,T12,T13,T14,T15],
	Duration is 10 * MakeSpan.


%	EXERCISE 2


%	list/2 
%	list(N,ListOfNumbers)


list(1,[2,3,4,10,22,11,17]).

list(2,[1,2,3,4,10,22,11,11,10,24]).

list(3,[2,3,4,5,10,23,10,22,11,17]).

%	allign/3
%	Uses collect_trios and collect_sums to solve the specified problem. Afterwards it makes
%	extensive use of element and element_aux in order to properly calculate Triple and Pos.

allign(Pos,Triple,Sum):-
	list(1,L1),
	list(2,L2),
	list(3,L3),
	collect_trios(L1,L2,L3,L4),
	L4 \= [],
	collect_sums(L4,Sums),
	ic_global:maxlist(Sums,Sum),
	element(I,Sums,Sum),
	I7 is I*3-2,
	element(I7,L4,FirstValue),
	I11 is I7 + 1,
	I12 is I7 + 2,
	element(I11,L4,SecondValue),
	element(I12,L4,ThirdValue),
	Triple = [FirstValue,SecondValue,ThirdValue],
	element_aux(I8,L1,FirstValue,SecondValue,ThirdValue),
	element_aux(I9,L2,FirstValue,SecondValue,ThirdValue),
	element_aux(I10,L3,FirstValue,SecondValue,ThirdValue),
	Pos = [I8,I9,I10].

%	collect_trios/3
%	Looks up every trio that can be formed by the elements of the first list (L1) in the
%	other two (L2 and L3). All valid combinations are stored in L4.

collect_trios([_,_],_,_,[]).
collect_trios([H1,H2,H3|T],L2,L3,L4):-
	element(I1,L2,H1),
	element(I2,L2,H2),
	element(I3,L2,H3),
	I2 #= I1 + 1,
	I3 #= I2 + 1,
	element(I4,L3,H1),
	element(I5,L3,H2),
	element(I6,L3,H3),
	I5 #= I4 + 1,
	I6 #= I5 + 1,
	!,
	L4 = [H1,H2,H3|Temp],
	collect_trios([H2,H3|T],L2,L3,Temp).
collect_trios([_,H2,H3|T],L2,L3,L4):-
	collect_trios([H2,H3|T],L2,L3,L4).

%	collect_sums/2
%	Sums each trio found in the list given and saves each result in the second list.

collect_sums([],[]).
collect_sums([H1,H2,H3|T1],[H4|T2]):-
	H4 is H1+H2+H3,
	collect_sums(T1,T2).

%	element_aux/3
%	ECLiPSe Prolog's element/3 was found inadequate for part of this exercise since its
%	results were messed up by the existence of duplicate elements. element_aux actually
%	looks ahead to the two elements that follow the one whose spot it's looking for, simply
%	to get around this specific issue.


element_aux(1,[First,Second,Third|_],First,Second,Third).
element_aux(Sol,[_|Rest],F,S,T):-
	element_aux(RecursiveSol,Rest,F,S,T),
	Sol is RecursiveSol+1.




%	EXERCISE 3

%	Scheduling Application
%	The Newspaper Story




students(WakeA,WakeV,WakeG):-
	Wakes = [WakeA,WakeV,WakeG],
	Wakes #:: 0..90.