:-use_module(library(ic)).

:-use_module(library(ic_global)).

:-use_module(library(branch_and_bound)).



%%% Exec1



worker(1,[4,1,3,5,6],[30,8,30,20,10]).

worker(2,[6,3,5,2,4],[140,20,70,10,90]).

worker(3,[8,4,5,7,10],[60,80,10,20,30]).

worker(4,[3,7,8,9,1],[30,40,10,70,10]).

worker(5,[7,1,5,6,4],[40,10,30,20,10]).

worker(6,[8,4,7,9,5],[20,100,130,220,50]).

worker(7,[5,6,7,4,10],[30,30,30,20,10]).

worker(8,[2,6,10,8,3],[50,40,20,10,60]).

worker(9,[1,3,10,9,6],[50,40,10,20,30]).

worker(10,[1,2,7,9,3],[20,20,30,40,50]).





solution(Tasks,Cost):-

	findall(X,worker(X,_,_),WList),

	state_constraints(WList,Tasks,Costs),

	ic_global:alldifferent(Tasks),

	sumlist(Costs,Cost),

	bb_min(labeling(Tasks),Cost,_).



state_constraints([],[],[]).

state_constraints([X|WList],[TX|Tasks],[CX|Costs]):-

	worker(X,WTs,WCs),

	element(I,WTs,TX),

	element(I,WCs,CX),

	state_constraints(WList,Tasks,Costs).







num_gen_min([N1,5,N2,N3,3],[M1,M2,0,M3,1],Diff):-

	[N1,N2,N3,M1,M2,M3] #:: [0..9],

	ic:alldifferent([N1,N2,N3,M1,M2,M3,5,3,0,1]),

	Num1 #= 10000 * N1 + 1000 * 5 + 100 * N2 + 10 * N3 + 3,
	Num2 #= 10000 * M1 + 1000 * M2 + 100 * 0 + 10 * M3 + 1,

	Diff #= abs(Num1 - Num2),

	bb_min(labeling([N1,N2,N3,M1,M2,M3]),Diff,_).







%%% Exec 3



student(alex,[4,1,3,5,6]). 
student(nick,[6,3,5,2,4]). 
student(jack,[8,4,5,7,10]).

student(helen,[3,7,8,9,1]).

student(maria,[7,1,5,6,4]).

student(evita,[8,4,7,9,5]).

student(jacky,[5,6,7,4,10]).

student(peter,[2,6,10,8,3]).

student(john,[1,3,10,9,6]).

student(mary,[1,6,7,9,10]).






solve(S,Cost):-

	collect_students(S),

	alloc_constraints(S,Prefs,Cost),

	bb_min(labeling(Prefs,Cost,_)).




collect_students(Stds):-

	findall((S,_),student(S,_),Stds).




alloc_constraints(Students,Theses,Cost):-

	constraints(Students,Theses,Cost),

	ic_global:alldifferent(Theses).




constraints([],[],0).
constraints([(X,Thesis)|SList],[Thesis|Prefs],TotalCost):-

	student(X,Ps),

	Thesis::Ps,

	element(Cost,Ps,Thesis),

	constraints(SList,Prefs,RCost),

	TotalCost #= Cost + RCost.







%%% Exec 4



box(1,140).

box(2,200). 
box(3,450).

box(4,700). 
box(5,120).

box(6,300). 
box(7,250). 
box(8,125).

box(9,600).

box(10,650).








%%% Exec5



provider(a,[0,750,1000,1500],[0,10,13,17]).

provider(b,[0,500,1250,2000],[0,8,12,22]).

provider(c,[0,1000,1750,2000],[0,15,18,25]).

provider(d,[0,1000,1500,1750],[0,13,15,17]).












