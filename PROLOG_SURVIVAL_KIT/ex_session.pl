% Write a predicate first that gets the first element of the list.
first([El|_], El).

% Write a predicate third which gets the third element in the list.
third([_,_,El|_], El).

% Write a predicate last which gets the last element of the list.
last([El], El).
last([_|T], El) :-
	last(T, El).

% write a predicate nth which gets the nth element of the list.
nth(1, [El|_], El).
nth(N, [_|T], El) :-
	N1 is N-1,
	nth(N1, T, El).

% write a predicate right_neighbor which gets the right neighbor of El in the list.
right_neighbor(El, [El, D|_], D).

right_neighbor(El, [_|T], D) :-
	right_neighbor(El, T, D).

% write a predicate decompose(List, H, T), such that H is the head of the list and T is the tail of the list.
decompose([H|T], H, T).

% Write apredicate is_sublist (L1, L2) that checks if L1 is a sublist of L2
is_sublist([], _).
is_sublist([H|T1], [H|T2]) :-
	check_remainder(T1, T2).

is_sublist(L1, [_|T2]) :-
	is_sublist(L1, T2).

check_remainder([], _).
check_remainder([H|T1], [H|T2]) :-
	check_remainder(T1, T2).

% Write a predicate add_beginning(El, List, List1) which adds the element El to the beginning of List
add_beginning(El, List, [El|List]).

% Wrtie a predicate add_end(El, List, List1) which adds the element El to the end of list List.
add_end(El, [], [El]).
add_end(El, [H|T], [H|T1]) :-
	add_end(El, T, T1).

% Write a predicate delete_one(El, List, List1) which deletes the first occurence of the element El in the lsit List
delete_one(_, [], []).
delete_one(El, [El], []).
delete_one(El, [El|T], T).
delete_one(El, [H|T], [H|T1]) :-
	delete_one(El, T, T1).

% Write a predicate delete_all(El, List, List1) which deletes all occurences of element El in the list.
delete_all(_, [], []).
delete_all(El, [El], []).
delete_all(El, [El|T], T1) :-
	delete_all(El, T, T1).

delete_all(El, [H|T], [H|T1]) :-
	delete_all(El, T, T1)

% Write a predicate all_equal(List) that checks if all elements in the list are equal