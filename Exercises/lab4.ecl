rotate_left(0,List,List).
rotate_left(Pos,[H|T],RotatedList):-
	Pos > 0,
	append(T,[H],AuxList),
	NewP is Pos-1,
	rotate_left(NewP,AuxList,RotatedList).


atom(hydrogen,[h1,h2,h3,h4,h5,h6,h7]).
atom(carbon,[c1,c2,c3,c4,c5,c6,c7]).
atom(chlorine,[cl]).

atom_bonds_to(h1,[c1]).
atom_bonds_to(h2,[c3]).
atom_bonds_to(h3,[c3]).
atom_bonds_to(h4,[c5]).
atom_bonds_to(h5,[c3]).
atom_bonds_to(h6,[c6]).
atom_bonds_to(h7,[c7]).
atom_bonds_to(c1,[c2,c4]).
atom_bonds_to(c2,[c1,c5]).
atom_bonds_to(c3,[h2,h3,h4,c4]).
atom_bonds_to(c4,[c1,c3,c6]).
atom_bonds_to(c5,[h4,c2,c7]).
atom_bonds_to(c6,[h6,c4,c7]).
atom_bonds_to(c7,[h7,c5,c6]).
atom_bonds_to(cl,[c2]).

carbon(C):-
	atom(carbon,CarbonList),
	member(C,CarbonList).

hydrogen(H):-
	atom(hydrogen,HydrogenList),
	member(H,HydrogenList).

bonded(X,Y):-
	atom_bonds_to(X,XBonds),
	member(Y,XBonds).

bonded(X,Y):-
	atom_bonds_to(Y,YBonds),
	member(X,YBonds).

methyl(M):-
	atom_bonds_to(M,MBonds),
	hydrogen(M1),
	hydrogen(M2),
	hydrogen(M3),
	member(M1,MBonds),
	member(M2,MBonds),
	member(M3,MBonds),
	M1 \= M2,
	M2 \= M3,
	M3 \= M1.
	