% Make a predicate concat which concatenates lists L1 and L2.
concat([], L, L).				% Base case: concatenating a list to an empty list.
concat([H|T], L, [H|T1]) :-		% Recursive case: add head of L1 to Res and concatenate tail of L1 to L into T1.
	concat(T, L, T1).