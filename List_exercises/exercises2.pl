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
sum([], 0).			% Base case: sum of integers in empty list is always equal to 0.
sum([I|T], N) :-	% Recursive case: If head of list is an integer, The sum of integers in list is equal to head of list plus the sum of integers in tail of list.
	integer(I),
	sum(T, N1),
	N is I + N1.

sum([_|T], N) :-	% Recursive case: sum of integers in list where head is not an integer is the sum of elements in tail of list.
	sum(T, N).


% Make a procedure is_list(L) that checks if L is a list. 
% We don't consider [a,b,c|d] a list, because it does not end with an empty list [].
is_list([]).		% base case: an empty list is a list.
is_list([_|T]) :- 	% Recursive case: check if tail is a list.
	is_list(T).

% Make a procedure is_palindrome(L) that checks if list L is a palindrome.
palindrome(L) :-
	reverse(L, L).	% A list is a palindrome if the reversed list is the same.

% The reversed list of an empty list is an empty list.
reverse([], []).

% // Auxilliary Predicates //

% Reverse a list
reverse([H|T], Rev) :-
	reverse(T, Rev_T),			% Reverse tail of list
	concat(Rev_T, [H], Rev).	% Concatenate reversed tail to head (add head to end).

% Concatenating L to empty list yield L.
concat([], L, L).
concat([H|T], L, [H|T1]) :-	% Keep head of dest and...
	concat(T, L, T1).		% Concatenate tail L to end of T.

% //

% Make a predicate circshiftL(L, N) which circularly shifts list L N spots to the left.

% Make a predicate circshiftR(L, N) which circularly shifts list L N spots to the right.

% Make a predicate max(L, El), whcih finds the largest element in list L.

% Make a predicate min(L, EL), which finds the smallest element in list L.

% Make a predicate subset(SubS, S) which checks if SubS is a subset of the set S.

% Make a predicate set(S) which is true if S is a set.

% Make a predicate set_diff(S1, S2, S3) so that S3 is the difference of sets S1 and S2.

% Make a predicate equal(S1, S2) which checks if sets S1 and S2 are equal.

% Make a predicate set_pow(S, R) which gets the power of set S.

% Make a predicate that finds the first element in a list with a given property defined by a unary predicate.

% Make a predicate that finds from a list those elements whose indices are given by a separate list. The indices list can be
% sorted or unsorted.

% Make a predicate convert_Nums(Nums, R) which converts a list of digits to a number by concatenating them.

% Make a predicate that checks if a list contains a sequence of integers such that every next integer is the sum of all the previous integers in the list.