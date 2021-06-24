%%% figure/2
%%% Description of 16 first shapes.

figure(1,middle(triangle,square)).
figure(2,middle(circle,triangle)).
figure(3,middle(square,circle)).
figure(4,middle(square,square)).
figure(5,middle(square,triangle)).
figure(6,middle(triangle,circle)).
figure(7,middle(circle,square)).
figure(8,middle(triangle,triangle)).
figure(9,botleft(circle,circle)).
figure(10,topleft(circle,circle)).
figure(11,botright(circle,circle)).
figure(12,topright(circle,circle)).
figure(13,topleft(square,square)).
figure(14,botleft(square,square)).
figure(15,topright(square,square)).
figure(16,botright(square,square)).


%%% relation/3
%%% Description of potential relations between figures.

%%% Relations between first eight figures.

relation(middle(S1,S2),middle(S2,S1),inverse).
relation(middle(triangle,S),middle(square,S),inner_triangle_to_square).
relation(middle(triangle,S),middle(circle,S),inner_triangle_to_circle).
relation(middle(circle,S),middle(triangle,S),inner_circle_to_triangle).
relation(middle(circle,S),middle(square,S),inner_circle_to_square).
relation(middle(square,S),middle(triangle,S),inner_square_to_triangle).
relation(middle(square,S),middle(circle,S),inner_square_to_circle).
relation(middle(S,triangle),middle(S,square),outer_triangle_to_square).
relation(middle(S,triangle),middle(S,circle),outer_triangle_to_circle).
relation(middle(S,circle),middle(S,triangle),outer_circle_to_triangle).
relation(middle(S,circle),middle(S,square),outer_circle_to_square).
relation(middle(S,square),middle(S,triangle),outer_square_to_triangle).
relation(middle(S,square),middle(S,circle),outer_square_to_circle).

%%% Relations between following eight figures.

relation(botleft(S,S),topleft(S,S),rotate_right).
relation(topleft(S,S),topright(S,S),rotate_right).
relation(topright(S,S),botright(S,S),rotate_right).
relation(botright(S,S),botleft(S,S),rotate_right).
relation(botleft(S,S),botright(S,S),rotate_left).
relation(botright(S,S),topright(S,S),rotate_left).
relation(topright(S,S),topleft(S,S),rotate_left).
relation(topleft(S,S),botleft(S,S),rotate_left).
relation(topright(S,S),botleft(S,S),rotate_180).
relation(botleft(S,S),topright(S,S),rotate_180).
relation(topleft(S,S),botright(S,S),rotate_180).
relation(botright(S,S),topleft(S,S),rotate_180).

relation(botleft(circle,circle),botleft(square,square),circles_to_squares).
relation(topleft(circle,circle),topleft(square,square),circles_to_squares).
relation(topright(circle,circle),topright(square,square),circles_to_squares).
relation(botright(circle,circle),botright(square,square),circles_to_squares).
relation(botleft(square,square),botleft(circle,circle),squares_to_circles).
relation(topleft(square,square),topleft(circle,circle),squares_to_circles).
relation(topright(square,square),topright(circle,circle),squares_to_circles).
relation(botright(square,square),botright(circle,circle),squares_to_circles).


%%% analogy/4
%%% Looks for relations between figures.


analogy(Number1,Number2,Number3,Number4):-
	figure(Number1,Shape1),
	figure(Number2,Shape2),
	figure(Number3,Shape3),
	figure(Number4,Shape4),
	relation(Shape1,Shape2,Relation),
	relation(Shape3,Shape4,Relation).