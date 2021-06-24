%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%============================Figures=========================%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% figure/2
figure(1,middle(triangle,square)).
figure(2,middle(circle,triangle)).
figure(3,middle(square,circle)).
figure(4,middle(square,square)).
figure(5,middle(square,triangle)).
figure(6,middle(triangle,circle)).
figure(7,middle(circle,square)).
figure(8,middle(triangle,triangle)).
figure(9,cornerSW(circle,circle)).
figure(10,cornerNW(circle,circle)).
figure(11,cornerSE(circle,circle)).
figure(12,cornerNE(circle,circle)).
figure(13,cornerNW(square,square)).
figure(14,cornerSW(square,square)).
figure(15,cornerNE(square,square)).
figure(16,cornerSE(square,square)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%===========================Relations========================%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% relation/3
%%% first 8 shapes (1-8) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ex. 1-5, 2-6 etc
relation(middle(S1,S2),middle(S2,S1),inverse):-
 figure(S1,middle(X,Y)),
 figure(S2,middle(Y,X)).

%%% ex. 1-6, 3-4 etc
relation(middle(S1,S2),middle(S2,S1),inner_similarity):-      
 figure(S1,middle(X,_)),
 figure(S2,middle(X,_)).

%%% ex. 1-4, 2-5 etc
relation(middle(S1,S2),middle(S2,S1),outer_similarity):-
 figure(S1,middle(_,X)),
 figure(S2,middle(_,X)).

%%% ex. 1-2, 4-7 etc
relation(middle(S1,S2),middle(S2,S1),in_out):-
 figure(S1,middle(X,_)),
 figure(S2,middle(_,X)).

%%% ex. 1-3, 2-6 etc
relation(middle(S1,S2),middle(S2,S1),out_in):-
 figure(S1,middle(_,X)),
 figure(S2,middle(X,_)).

%%% ex. 1-5=4=7-3
%%%relation(middle(S1,S2),middle(S2,S1),reduction):-
%%% figure(S1,middle(X,Y)),
%%% figure(S2,middle(

%%% next 8 shapes (9-16)
%%% shape on the same corner %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% ex. 10-13
relation(cornerNW(S1,S2),cornerNW(S2,S1),same_corner):-
 figure(S1,cornerNW(_,_)),
 figure(S2,cornerNW(_,_)),
 S1\==S2.

%%% ex. 12-15
relation(cornerNE(S1,S2),cornerNE(S2,S1),same_corner):-
 figure(S1,cornerNE(_,_)),
 figure(S2,cornerNE(_,_)),
 S1\==S2.

%%% ex. 9-14
relation(cornerSW(S1,S2),cornerSW(S2,S1),same_corner):-
 figure(S1,cornerSW(_,_)),
 figure(S2,cornerSW(_,_)),
 S1\==S2.

%%% ex. 11-16
relation(cornerSE(S1,S2),cornerSE(S2,S1),same_corner):-
 figure(S1,cornerSE(_,_)),
 figure(S2,cornerSE(_,_)),
 S1\==S2.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% shape on the upper side but different flank(left or right) %
%%% ex. 10-12, 10-15
relation(cornerNW(S1,S2),cornerNE(S2,S1),same_up):-
 figure(S1,cornerNW(_,_)),
 figure(S2,cornerNE(_,_)).

%%% ex. 12-10, 12-13
relation(cornerNE(S1,S2),cornerNW(S2,S1),same_up):-
 figure(S1,cornerNE(_,_)),
 figure(S2,cornerNW(_,_)).

%%% shape on the lower side but different flank(left or right)
%%% ex. 9-11, 9-16
relation(cornerSW(S1,S2),cornerSE(S2,S1),same_down):-
 figure(S1,cornerSW(_,_)),
 figure(S2,cornerSE(_,_)).

%%% ex. 11-9, 11-14
relation(cornerSE(S1,S2),cornerSW(S2,S1),same_down):-
 figure(S1,cornerSE(_,_)),
 figure(S2,cornerSW(_,_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% shape on the right flank but different side(up or down) %%%%
%%% ex. 12-11, 12-16
relation(cornerNE(S1,S2),cornerSE(S2,S1),same_right):-
 figure(S1,cornerNE(_,_)),
 figure(S2,cornerSE(_,_)).

%%% ex. 11-12, 11-15
relation(cornerSE(S1,S2),cornerNE(S2,S1),same_right):-
 figure(S1,cornerSE(_,_)),
 figure(S2,cornerNE(_,_)).

%%% shape on the left flank but different side(up or down)
%%% ex. 10-9, 10-14
relation(cornerNW(S1,S2),cornerSW(S2,S1),same_left):-
 figure(S1,cornerSW(_,_)),
 figure(S2,cornerSE(_,_)).

%%% ex. 9-10, 9-13
relation(cornerSW(S1,S2),cornerNW(S2,S1),same_left):-
 figure(S1,cornerSE(_,_)),
 figure(S2,cornerSW(_,_)).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% shape on the exact opposite corner %%%%%%%%%%%%%%%%%%%%%%%%%
%%% ex. 9-12, 9-15
relation(cornerSW(S1,S2),cornerNE(S2,S1),opposite_corner):-
 figure(S1,cornerSW(_,_)),
 figure(S2,cornerNE(_,_)).

relation(cornerNW(S1,S2),cornerSE(S2,S1),opposite_corner):-
 figure(S1,cornerNW(_,_)),
 figure(S2,cornerSE(_,_)).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%=========================Analogies==========================%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%% analogy/4
analogy(S1,S2,T1,T2):-
 relation(middle(S1,S2),middle(S2,S1),R),
 relation(middle(T1,T2),middle(T2,T1),R),
 T2\=T1,
 T2\=S1,
 T2\=S2.

/*
analogy(S1,S2,T1,T2):-
 relation(cornerNW(S1,S2),cornerNW(S2,S1),R),
 relation(cornerNE(T1,T2),cornerNE(T2,T1),R),
 T2\=T1.

analogy(S1,S2,T1,T2):-
 relation(cornerNW(S1,S2),cornerNW(S2,S1),R),
 relation(cornerSE(T1,T2),cornerSE(T2,T1),R),
 T2\=T1.

analogy(S1,S2,T1,T2):-
 relation(cornerNW(S1,S2),cornerNW(S2,S1),R),
 relation(cornerSW(T1,T2),cornerSW(T2,T1),R),
 T2\=T1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

analogy(S1,S2,T1,T2):-
 relation(cornerNW(S1,S2),cornerSW(S2,S1),R),
 relation(cornerNW(T1,T2),cornerSW(T2,T1),R),
 T2\=T1.

analogy(S1,S2,T1,T2):-
 relation(cornerNE(S1,S2),cornerNW(S2,S1),R),
 relation(cornerNE(T1,T2),cornerNW(T2,T1),R),
 T2\=T1.

analogy(S1,S2,T1,T2):-
 relation(cornerNW(S1,S2),cornerSE(S2,S1),R),
 relation(cornerNW(T1,T2),cornerSE(T2,T1),R),
 T2\=T1.

analogy(S1,S2,T1,T2):-
 relation(cornerSW(S1,S2),cornerSW(S2,S1),R),
 relation(cornerSW(T1,T2),cornerSW(T2,T1),R),
 T2\=T1.
*/





