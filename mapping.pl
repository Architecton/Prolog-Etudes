% Make a predicate that matches a list of integers L with a list of the squares of integers in list L.
squares([], []).
squares([I|T], [I1|T1]) :-
	I1 is I*I,
	squares(T, T1).

% Note the general ways of applying a transformation to each element in a list.

% Make a predicate add_tralala which transforms each element in a list to a tuple with 'tralala' as the second element.
add_tralala([], []).			% Base case: empty list.
add_tralala([I|T], [I1|T1]) :-	% Recursive case: use add_end predicate to add tralala to head.
	add_end(tralala, [I], I1),
	add_tralala(T, T1).			% Make recursive call for tail of list.

% add_end: auxiliary predicate - add element to end of list.
add_end(El, [], [El]).
add_end(El, [H|T], [H|T1]) :-
	add_end(El, T, T1).