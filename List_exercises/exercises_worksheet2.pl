% Make a predicate delete_one(El, L, L1) which removes the first occurence of El from list L.
delete_one(_, [], []). 			% Base case: deleting any element from an empty list yields an empty list.
delete_one(El, [El|T], T).			% Base element: if El is head of list L then result is tail of list L.
delete_one(El, [H|T], [H|T1]) :-	% Recursive case: keep head and try to delete element El from tail of L.
	delete_one(El, T, T1).

% Make a predicate delete_all(El, L, L1) which removes all occurences of element El from the list L.
delete_all(_, [], []).				% Base case: deleting any element from an empty list yields an empty list.
delete_all(El, [El|T1], T) :-		% Base case: if El is head of list L then make recursive call for remaining tail.
	delete_all(El, T1, T).
delete_all(El, [H|T], [H|T1]) :-	% Recursive case: keep head and make recursive call for tail.
	delete_all(El, T, T1).

% Make a predicate that checks if all elements in a list are equal.
all_equal([]).
all_equal([_]).
all_equal([X, X|T]) :-
	all_equal([X|T]).

% Make a predicate is_longer(L, L1) that checks if list L is longer than list L1.
is_longer([_], []).			% Base case: any non-empty list is longer than an empty list.
is_longer([_|T], [_|T1]) :-	% Recursive case: list L is longer than list L1 if tail of L is longer than tail of L1.
	is_longer(T, T1).

% Make a predicate len which gets the length of list L.
len([], 0).			% Base case: the length of an empty list is 0.
len([_|T], N) :-	% Recursive case: the length of a list is one more than the length of its tail.
	length(T, N1),	% Get length of tail.
	N is N1 + 1.	% Length of list is one greater than the length of its tail.

% Make a predicate num_occurrences(El, L, N), so that the number N is the number of occurrences of element El in list L.
num_occurrences(_, [], 0).			% Base case: number of occurrances of any element in an empty list is 0.
num_occurrences(El, [El|T], N) :-	% Recursive case: If element El found in head of list L then number of occurrances of El is
	num_occurrences(El, T, N1),		% one greater than the number of occurrences of element El in tail of list L.
	N is N1+1.

num_occurrences(El, [_|T], N) :-	% Recursive case. Number of occurrances of element El in List L, if head of L is not El, is equal to
	num_occurrences(El, T, N).		% the number of occurrences of element El

% Make a procedure sum(L, Res) such that Res is the sum of integers in list L. L can contain non-integer structures.

% Make a procedure is_list(L) that checks if L is a list. 
% We don't consider [a,b,c|d] a list, because it does not end with an empty list [].

% Make a procedure is_palindrome(L) that checks if list L is a palindrome.

% The reversed list of an empty list is an empty list.

% // Auxilliary Predicates //

% Reverse a list

% Concatenating L to empty list yield L.

% //