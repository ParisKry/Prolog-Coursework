%	it114/14
%	Krionas Paraskevas



%	EXERCISE 1
%	a)


%	split_the_lables/3 (List,Correct,Waste)
%	When given a list (List), it looks for the elements of said list the triple of which
%	also exists in List. Any such elements (and their pairs) found are removed from List
%	and inserted into Correct. Any elements that do not have a pair are inserted into Waste.

split_the_labels([],[],[]).

split_the_labels([Head|Tail],[Head,Triple|Correct],Waste):-
	Triple is 3*Head,
	delete(Triple,Tail,Remainder),
	split_the_labels(Remainder,Correct,Waste).

split_the_labels([Head|Tail],Correct,[Head|Waste]):-
	split_the_labels(Tail,Correct,Waste).

%	b)


%	lowest_labels/3 (Labels,N,L)
%	Sorts Labels into SortedLabels, then calls lowest_labels_aux.

lowest_labels(Labels,N,L):-
	setof(MemberVariable,member(MemberVariable,Labels),SortedLabels),
	lowest_labels_aux(SortedLabels,N,L).

%	lowest_labels_aux/3 (Labels,N,Result)
%	Calls split_the_labels in order to remove unwanted elements. N is doubled because the
%	number of elements returned in Result equals 2*N, then get_results is called.

lowest_labels_aux(Labels,N,Result):-
	split_the_labels(Labels,SplitLabels,_),
	Double is 2*N,
	get_results(SplitLabels,Double,Result),
	!.

%	get_results/3 (FirstList,Double,SecondList)
%	Essentially shortens FirstList to SecondList which has a length of Double.

get_results(_,0,[]).
get_results([Head|Tail],Double,[Head|Result]):-
	Double>0,
	Counter is Double-1,
	get_results(Tail,Counter,Result).










%	EXERCISE 2


pat(0,[t,e,s,t],[t,e,s,t]).
pat(1,[t,*,s,t],[t,e,*,t]).
pat(2,[*,*,*,*],[i,t]).
pat(3,[s,h,a,k,e,s,*,e],[s,*,s,p,e,a,r,e]).
pat(4,[s,h,a,k,e,s,*,e],[*,p,e,a,r,e]).
pat(5,[*,*,i,*,l,l,*,m],[w,i,l,l,i,a,m]).


%	This code was left in its early state and is non-functional.


/*
patterns([],[],[]).
patterns([H|T1],[H|T2],[H|T3]):-
	patterns(T1,T2,[H|T3]).
patterns([*|T1],[H|T2],Title).
	
patterns([H|T1],[*|T2],Title).
*/



%	EXERCISE 3


%%% station(Name,X,Y,Lines).
%%% Data regarding Metro Connections in London.

station(acton_town,6,11,[piccadilly,district]).
station(aldgate,29.7,12.6,[circle]).
station(aldgate_east,31.8,12.6,[district,metropolitan]).
station(aldwych,23.8,12.6,[piccadilly_aldwych_branch]).
station(angel,26.1,16.4,[northern_west]).
station(baker_street,17.5,16.4,[metropolitan,circle,bakerloo,jubilee,metropolitan_amersham_branch]).
station(bank,27.4,14,[central,northern_city,subway_between_bank_and_monument]).
station(barbican,26.1,15.8,[circle,metropolitan]).
station(barons_court,11.3,10,[district,piccadilly]).
station(bayswater,13.6,14.5,[circle]).
station(bethnal_green,31.6,14,[central]).
station(blackfriars,25.2,11.2,[circle,district]).
station(bond_street,17.6,14,[central,jubilee]).
station(borough,25,8,[northern_west]).
station(camden_town,22.0,18.8,[northern_city,northern_west]).
station(cannon_street,26.6,11.2,[circle,district]).
station(chancery_lane,24.4,14,[central]).
station(charing_cross,22.0,11.2,[bakerloo,jubilee,northern_city]).
station(chiswick_park,6,10.2,[district]).
station(covent_garden,23,13.2,[piccadilly]).
station(ealing_broadway,4,14,[central,district]).
station(ealing_common,6,12.5,[piccadilly,district]).
station(earls_court,13,10,[district,district_exhibition_branch,piccadilly]).
station(east_acton,9,14,[central]).
station(edgware_road_bakerloo,14.7,16.3,[bakerloo]).
station(edgware_road_circle,15.6,16.4,[circle,metropolitan]).
station(elephant_and_castle,23.5,6.5,[bakerloo,northern_west]).
station(embankment,22,10,[bakerloo,circle,district,northern_city]).
station(euston,22.0,17.0,[northern_city,northern_west,victoria]).
station(euston_square,22.4,16.4,[circle,metropolitan]).
station(farringdon,25.2,15.8,[circle,metropolitan]).
station(finchley_road,16,18.4,[jubilee,metropolitan_amersham_branch]).
station(finsbury_park,28,20,[piccadilly,victoria]).
station(gloucester_road,14.5,10,[circle,district]).
station(goldhawk_road,10.6,12.4,[metropolitan]).
station(goodge_street,22,15,[northern_city]).
station(great_portland_street,19.7,16.4,[circle,metropolitan]).
station(green_park,19,12.5,[jubilee,piccadilly,victoria]).
station(hammersmith,10.4,10.0,[district,metropolitan,piccadilly]).
station(heathrow_terminal_4,1,6.8,[piccadilly]).
station(heathrow_terminals_1_2_3,1,7.6,[piccadilly]).
station(high_street_kensington,13.6,12.4,[circle]).
station(highbury_and_islington,27.2,17.5,[victoria]).
station(holborn,23.8,14,[central,piccadilly,piccadilly_aldwych_branch]).
station(holland_park,12.6,14,[central]).
station(hyde_park_corner,17.2,11.9,[piccadilly]).
station(kennington,22,5,[northern_city,northern_west]).
station(kensington_olympia,12.4,11.2,[district_exhibition_branch]).
station(kings_cross,24.0,16.4,[piccadilly,metropolitan,circle, northern_city,victoria]).
station(knightsbridge,16.5,11.0,[piccadilly]).
station(ladbroke_grove,11.4,15.0,[metropolitan]).
station(lambeth_north,22.8,7.2,[bakerloo]).
station(lancaster_gate,15.8,14,[central]).
station(latimer_road,11.0,14.2,[metropolitan]).
station(leicester_square,22.0,12.5,[northern_city,piccadilly]).
station(liverpool_street,29.6,14.0,[central,circle,metropolitan]).
station(london_bridge,26.1,9,[northern_west]).
station(mansion_house,26,11.2,[circle,district]).
station(marble_arch,16.5,14,[central]).
station(marylebone,16.3,16.6,[bakerloo]).
station(mile_end,33.6,14,[central,district]).
station(monument,26.8,11.2,[circle,district,subway_between_bank_and_monument]).
station(moorgate,27.4,15.8,[circle,metropolitan,northern_west]).
station(mornington_crescent,22.0,18,[northern_city]).
station(neasden,13.4,21.8,[jubilee]).
station(north_acton,8,14,[central]).
station(notting_hill_gate,13.6,14,[central,circle]).
station(old_street,27.2,16.5,[northern_west]).
station(oval,21.5,4.2,[northern_city]).
station(oxford_circus,19.5,14,[bakerloo,central,victoria]).
station(paddington,14.0,16.4,[bakerloo,circle,metropolitan]).
station(piccadilly_circus,21.0,12.5,[bakerloo,piccadilly]).
station(pimlico,19,8.6,[victoria]).
station(queens_park,12,18.4,[bakerloo]).
station(queensway,14.8,14,[central]).
station(ravenscourt_park,9.8,10.2,[district]).
station(regents_park,19.3,16,[bakerloo]).
station(royal_oak,12.1,16.0,[metropolitan]).
station(russell_square,23.8,14.8,[piccadilly]).
station(shepherds_bush_central,11.5,14,[central]).
station(shepherds_bush_met,10.6,13.5,[metropolitan]).
station(sloane_square,15.3,10,[circle,district]).
station(south_kensington,15.6,10,[circle,district,piccadilly]).
station(st_james_park,20,10,[circle,district]).
station(st_pauls,26.1,14,[central]).
station(stamford_brook,8.3,10.2,[district]).
station(stockwell,21,4,[northern_city,victoria]).
station(stratford,33,16.4,[central]).
station(temple,24.1,10.4,[circle,district]).
station(tottenham_court_road,22,14,[central,northern_city]).
station(tower_hill,28.8,11.2,[circle,district]).
station(turnham_green,7,10,[piccadilly,district]).
station(vauxhall,19,7,[victoria]).
station(victoria,19,10,[circle,district,victoria]).
station(warren_street,22.0,16.0,[northern_city,victoria]).
station(waterloo,22,8.3,[bakerloo,northern_city,waterloo_and_city]).
station(west_acton,7,14,[central]).
station(west_kensington,12,10,[district]).
station(westbourne_park,11.8,15.5,[metropolitan]).
station(westminster,21.2,10,[circle,district]).
station(white_city,9.9,14,[central]).
station(whitechapel,32.4,13.0,[district,metropolitan]).


%	a)


%	connected/3 (St1,St2,Line)
%	Succeeds if there is a line (Line) that both stations (St1,St2) are connected with.

connected(St1,St2,Line):-
	station(St1,_,_,LinesSt1),
	station(St2,_,_,LinesSt2),
	member(Line,LinesSt1),
	member(Line,LinesSt2),
	St1 \= St2.

%	b)


%	number_of_stations/1 (Number)
%	Creates a list of all stations, then returns its length.

number_of_stations(Number):-
	findall(FindallVariable,station(FindallVariable,_,_,_),List),
	length(List,Number).

%	c)

%	number_of_lines/1 (Number)
%	Returns the number of different lines using a rather arbitrary way.

number_of_lines(Number):-
	findall(X,station(_,_,_,X),List),
	findall(A,member([A],List),Unraveled1),
	findall(B,member([_,B],List),Unraveled2),
	findall(C,member([_,_,C],List),Unraveled3),
	append(Unraveled1,Unraveled2,Unraveled5),
	append(Unraveled3,Unraveled5,Unraveled6),
	setof(Z,member(Z,Unraveled6),SortedUnraveled),
	length(SortedUnraveled,Number).

%	d)

%	find_route/3
%	This code was also left incomplete.


find_route(InitialStation,FinalStation,Route):-
	find_route_safe(InitialStation,FinalStation,[InitialStation],[],Route).
find_route_safe(Station,FinalStation,_,_,[Station,FinalStation]):-
	connected(Station,FinalStation,_).
find_route_safe(Station,FinalStation,Visited,VisitedLines[Station|RestRoute]):-
	connected(Station,NextStation,Line),
	not(member(NextStation,Visited)),
	not(member(Line,VisitedLines)),
	find_route_safe(Station,FinalStation,[NextStation|Visited],[Line|VisitedLines],RestRoute).