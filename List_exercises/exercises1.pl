% Make a predicate last(List, El) which returns the last element of the list.
last([El], El).		% Base case: the list contains only one element.
last([_|T], El) :-	% Recursive case: get last element of tail of list.
	last(T, El).

% Make a predicate add_last(El, L, L2) which adds element El to the end of list L2.
add_last(El, [], [El]).			% Base case: Adding element to an empty list
add_last(El, [H|T], [H|T1]) :-	% Recursive case: keep head and add element to tail.
	add_last(El, T, T1).

% Make a predicate nth that returns the nth element of the list.
nth([El|_], 1, El).		% Base case: accessing the first element in the list.
nth([_|T], N, El) :-	% Recursive case: accessing the (N-1)th element in the tail of the list.
	N1 is N-1,
	nth(T, N1, El).

% Make a predicate sublist(SubL, L) which returns true if SubL is a sublist of L.
sublist([], _). 			% An empty list is a sublist of any list.
sublist([H|T], [H|T1]) :-	% If heads match, check remainder of of sublist candidate against tail of L.
	remainder(T, T1).

sublist(SubL, [_|T]) :- 	% If heads do not match. Try to match to tail of L.
	sublist(SubL, T).

remainder([], _).			% Base case: All elements of SubL have been matched.
remainder([H|T], [H|T1]) :-	% Try to match next element in SubL until all have been used up and the base case executes.
	remainder(T, T1).

% Make a predicate split(L, H, T) so that H is the head of list L and T is the tail of list L.
split([H|T], H, T).

% Make a predicate add_start(El, L, L1) which adds element El to list L.
add_start(El, L, [El|L]).

% Make a predicate right_element which finds the right element of element El int the list L.
right_element(El, [El, D|_], D). % Base case: element El is the head - take element right of head.
right_element(El, [_|T], D) :-	 % Recursive case: check if element El is found in tail of list.
	right_element(El, T, D).

% Make a predicate first(L, El) which finds the first element of list L.
first([El|_], El).

% Make a predicate delete(El, L, L1) which deletes element El from list L.
delete(_, [], []).
delete(El, [El|T], T).
delete(El, [H|T], [H|T1]) :-
	delete(El, T, T1).


% The recursive definition of a list in Prolog:
% 1. A list can be empty.
% 2. A list can have a head, which is an expression and a tail which is a list [Head|Tail].

% Make a predicate contains which checks if element El is contained in list L.
contains(El, [El|_]).	% Base case: El is head of list L
contains(El, [_|T]) :-	% Recursive case: El is found in tail if tail T contains element El.
	contains(El, T).