% Make a predicate delete_one(El, L, L1) which removes the first occurence of El from list L.
delete_one(_, [], []).
delete_one(El, [El], []).
delete_one(El, [El|T], T).
delete_one(El, [H|T], [H|T1]) :-
	delete_one(El, T, T1).

% Make a predicate delete_all(El, L, L1) which removes all occurences of element El from the list L.
delete_all(_, [], []).
delete_all(El, [El], []).
delete_all(El, [El|T], L) :-
	delete_all(El, T, L).
delete_all(El, [H|T], [H|T1]) :-
	delete_all(El, T, T1).

% Make a predicate that checks if all elements in a list are equal.
all_equal([]).
all_equal([_]).
all_equal([X, X|T]) :-
	all_equal([X|T]).

% Make a predicate is_longer(L, L1) that checks if list L is longer than list L1.
is_longer([_|_], []).
is_longer([_|T], [_|T1]) :-
	is_longer(T, T1).

% Make a predicate len which gets the length of list L.
len([], 0).
len([_|T], N) :-
	len(T, N1),
	N is N1 + 1.

% Make a predicate num_occurrences(El, L, N), so that the number N is the number of occurrences of element El in list L.
num_occurrences(_, [], 0).
num_occurrences(El, [El|T], N) :-
	num_occurrences(El, T, N1),
	N is N1 + 1.
num_occurrences(El, [_|T], N) :-
	num_occurrences(El, T, N).

% Make a procedure sum(L, Res) such that Res is the sum of integers in list L. L can contain non-integer structures.
sum([], 0).
sum([I|T], N) :-
	integer(I),
	sum(T, N1),
	N is I + N1.

% Make a procedure is_list(L) that checks if L is a list. 
% We don't consider [a,b,c|d] a list, because it does not end with an empty list [].
is_list([]).
is_list([_|T]) :-
	is_list(T).

% Make a procedure is_palindrome(L) that checks if list L is a palindrome.
is_palindrome(L) :- reverse(L, L).

reverse([], []).
reverse([H|T], Rev) :-
	reverse(T, RevT),
	concat(RevT, [H], Rev).

concat([], L, L).
concat([H|T], L, [H|T1]) :-
	concat(T, L, T1).


% Make a predicate circshiftL(L, N, L1) which circularly shifts list L N spots to the left.

% Make a predicate circshiftR(L, N) which circularly shifts list L N spots to the right.

% Make a predicate max(L, El), whcih finds the largest element in list L.

% Make a predicate min(L, EL), which finds the smallest element in list L.

% Make a predicate subset(SubS, S) which checks if SubS is a subset of the set S.

% Contains: auxiliary predicate (see exercises1.pl)

% Make a predicate set(S) which is true if S is a set.
	
% Make a predicate set_diff(S1, S2, S3) so that S3 is the difference of sets S1 and S2.

% Make a predicate equal_sets(S1, S2) which checks if sets S1 and S2 are equal.

% Make a predicate that finds from a list those elements whose indices are given by a separate list. The indices list can be
% sorted or unsorted.

% Make a predicate convert_digits(Digits, R) which converts a list of digits to a number by concatenating them.

% pow: auxiliary predicate for getting a power of an integer.

% Make a predicate setify that matches a list to a list with no duplicates.

% Make a predicate that checks if a list contains a sequence of integers such that every next integer is the sum of all the previous integers in the list.

% Make a predicate union(S1, S2, S3) so that S3 is an union of S1 and S2

% Make a predicate intersection(S1, S2, S3) so that S3 is the intersection of S1 and S2.

% Make a predicate symmetric_diff(S1, S2, S3) so that S3 is the symmetric difference of S1 and S2.