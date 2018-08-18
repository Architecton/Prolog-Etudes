% Make a predicate reverse which reverses a list.
reverse([], []).							% Base case: reversing an empty list yields the empty list.
reverse([H|T], Reversed) :-					% Recursive case: to reverse a non-empty list...
	reverse(T, Reversed_tail),				% ...reverse the tail of list...
	concat(Reversed_tail, [H], Reversed).	% ...and concatenate the reversed tail to the head of original list.

% concat: auxiliary predicate for concatenating two lists
concat([], L, L).			% Base case: concatenating an empty list to any list L yields list L.
concat([H|T], L, [H|T1]) :-	% Recursive case: add head of list being concatenated to result and...
	concat(T, L, T1).		% ...concatenate the tail of L1 with L2.