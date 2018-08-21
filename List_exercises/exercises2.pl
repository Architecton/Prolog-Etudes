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
is_longer([_|_], []).		% Base case: any non-empty list is longer than an empty list.
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

% // Auxilliary Predicates //

% Reverse a list

% The reversed list of an empty list is an empty list.
reverse([], []).

reverse([H|T], Rev) :-
	reverse(T, Rev_T),			% Reverse tail of list
	concat(Rev_T, [H], Rev).	% Concatenate reversed tail to head (add head to end).

% Concatenating L to empty list yield L.
concat([], L, L).
concat([H|T], L, [H|T1]) :-	% Keep head of dest and...
	concat(T, L, T1).		% Concatenate tail L to end of T.

% //

% Make a predicate circshiftL(L, N, L1) which circularly shifts list L N spots to the left.
circshiftL(L, 0, L).
circshiftL([H|T], N, L1) :-
	concat(T, [H], C),
	N1 is N-1,
	circshiftL(C, N1, L1).

% Make a predicate circshiftR(L, N) which circularly shifts list L N spots to the right.
circshiftR(L, 0, L).				% Base case: shifting list L by 0 yields the same list L.
circshiftR(L, N, L1) :-				% Recursive case: shifted by N
	reverse(L, [H1|T1]),			% Reverse list.
	reverse(T1, Front),				% Reverse tail of reversed list.
	concat([H1], Front, Shifted),	% Concatenate head of reversed list (last element) to front of original list (lsit minus the last element).
	N1 is N-1,						% Circularly shift result by N-1.	
	circshiftR(Shifted, N1, L1).

% Make a predicate max(L, El), whcih finds the largest element in list L.
max([El], El).						% Base case: the maximum element in a singleton list is the element in the list.
max([El1|T], Res) :-				% Recursive case: Res is the largest elemen in list if...
	max(T, ResT),					% ...ResT is the largest element in the tail of the list...
	max(El1, ResT, Res).			% ...and Res is the largest element between head of list and largest element found in tail.

max(El1, El2, El1) :- El1 >= El2.	% Base case: trivially compare two elements.
max(El1, El2, El2) :- El1 < El2.	% Base case: trivially compare two elements.

% Make a predicate min(L, EL), which finds the smallest element in list L.
min([El], El).						% Similar
min([El1|T], Res) :-
	min(T, ResT),
	min(El1, ResT, Res).

min(El1, El2, El1) :- El2 >= El1.
min(El1, El2, El2) :- El1 > El2.

% Make a predicate subset(SubS, S) which checks if SubS is a subset of the set S.
subset([], _).			% Base case: an empty set is a subset of every set.
subset([H|T], S) :-		% Recursive case: Check for each element in SubS if it is contained in S.
	contains(H, S),
	subset(T, S).

% Contains: auxiliary predicate (see exercises1.pl)
contains(El, [El|_]).
contains(El, [_|T]) :-
	contains(El, T).

% Make a predicate set(S) which is true if S is a set.
set([]).					% Base case. An empty list represents a set.
set([H|T]) :-				% Recursive case: a list represents a set if there are no duplicate elements.
	not(contains(H, T)),
	set(T).
	
% Make a predicate set_diff(S1, S2, S3) so that S3 is the difference of sets S1 and S2.
set_diff(S1, [], S1).		% Base case: S1 - {} = S1
set_diff(S1, [H|T], S3) :-	% Recursive case: Remove elements in S2 from S1.
	delete_all(H, S1, I),	% Delete all occurences of H in S1. I is intermediate result.
	set_diff(I, T, S3).		% Recur for intermediate result.

% Make a predicate equal_sets(S1, S2) which checks if sets S1 and S2 are equal.
equal_sets([], []).			% Base case: two empty lists represent the same set.
equal_sets([H|T], S2) :-	% Recursive case: Check if both lists represent sets and...
	set([H|T]),
	set(S2),
	contains(H, S2),		% The second list contains element at head of S1.
	delete_one(H, S2, I),	% Remove element H from S2.
	equal_sets(T, I).		% Recur for tail of S1 and I (second set with S removed). If all elements successufly checked, base case will be reached.

% Make a predicate that finds from a list those elements whose indices are given by a separate list. The indices list can be
% sorted or unsorted.
find(_, [], []).				% Base case: If indexing list is empty, return empty list.
find(L, [HI|TI], [RI|TRI]) :-	% Recursive case: find HI-th element in L and make it Head of result list.
	nth(L, HI, RI),
	find(L, TI, TRI).			% Recur for tail of indexing list and tail of results list.

% //
% nth: auxiliary predicate for finding nth element in list (see exercises1.pl).
nth([El|_], 1, El).
nth([_|T], N, El) :-
	N1 is N-1,
	nth(T, N1, El).
% //

% Make a predicate convert_digits(Digits, R) which converts a list of digits to a number by concatenating them.
convert_digits(L, Res) :- convert_digits(L, _, Res).	% Make a auxiliary predicate version.

convert_digits([D], 0, D).								% Base case: If single digit in list return that digit.
convert_digits([D|TD], K, Res) :-						% Recursive case: Convert tail to digit and find power of top digit...
	convert_digits(TD, K1, Res1),
	K is K1+1,
	pow(10,K,P),
	Res is Res1 + D*P.									%...The result is the tail digit plus the top digit (appended by addition of number generated by appending zeroes.)

% pow: auxiliary predicate for getting a power of an integer.
pow(_, 0, 1).			% Base case: anything to a power of 0 is equal to 1.
pow(P, K, Res) :-		% Recursive case: computing P^k...
	K1 is K-1,			% K1 is K-1.
	pow(P, K1, Res1),	% Res1 is P^K1 which is equal to P^(K-1)
	Res is Res1 * P.	% Since Res1 is P^(K-1) then Res is Res1 * P which is equal to P^K (which is what we want).



% Make a predicate setify that matches a list to a list with no duplicates.
setify([], []).				% Base case: An empty list is a set.
setify([H|T], [H|T1]) :-	% Recursive case: Match heads and remove all duplicates of head from tail of list representing the set.
	delete_all(H, T, I),	% Note intermediate tail I.
	setify(I, T1).			% Recur for next element in new tail.

% Make a predicate that checks if a list contains a sequence of integers such that every next integer is the sum of all the previous integers in the list.
is_sum_seq([]).				% Base case: An empty list represents a valid sequence.
is_sum_seq([_]).			% Base case: A singleton element represents a valid sequence.
is_sum_seq(L) :-			% Recursive case: List L represents a valid sequence if...
	reverse(L, [HR|TR]),	% ...[HR|TR] is the reversed list L and,
	sum(TR, S),				% ...S is the sum of the tail of the reversed list L and
	!,						% ...cut, and
	S == HR,				% ...The sum of the tail of the reversed list is equal to its head.
	reverse(TR, I),			% ...I is the reversed tail of the reversed list L (same as L with the last element removed).
	is_sum_seq(I).			% ...I is a valid sequence.


% Make a predicate union(S1, S2, S3) so that S3 is an union of S1 and S2
union([], S, S) :- set(S).		% Base case: union of an empty set with a set S is the set S.
union([H|T], S2, [H|T1]) :-		% Recursive case: add head of S1 to union if...
	set([H|T]),					% ...S1 is a set, and...
	set(S2),					% ...S2 is a set, and...
	not(contains(H, S2)),		% ...H is not contained in S2
	union(T, S2, T1).			% ...T1 is union of tail of S1 and S2.

union([_|T], S2, S3) :-			% Recursive case: For situations when H is contained in S2.
	set(T),						% Tail of S1 is a set.
	set(S2),					% S2 is a set.
	union(T, S2, S3).			% S3 is union of T and S2.

% Make a predicate intersection(S1, S2, S3) so that S3 is the intersection of S1 and S2.
intersection(S, [], []) :- set(S).	% Base case: the intersection of any set with the empty set is an empty set.

intersection([H|T], S2, [H|T1]) :-	% Recursive case: H is in intersection if...
	set([H|T]),						% ...S1 is a set, and...
	set(S2),						% ...S2 is a set, and...
	contains(H, S2),				% H is in S2, and...
	intersection(T, S2, T1).		% T1 is the intersection of T and S2.

intersection([_|T], S2, S3) :-		% Recursive case: For situations when H is not contained in S2.
	set(T),							% Tail of S1 is a set, and...
	set(S2),						% ...S2 is a set, and...
	intersection(T, S2, S3).		% S3 is the intersection of tail of S1 and set S2.


% Make a predicate symmetric_diff(S1, S2, S3) so that S3 is the symmetric difference of S1 and S2.
symmetric_diff([], S, S).				% Base case: The symmetric difference of an empty set and any set S is the set S.

symmetric_diff([H|T], S2, [H|T1]) :-	% Recursive case: Add head of S1 to symmetric difference if...
	set([H|T]),							% ...S1 is a set, and...
	set(S2),							% ...S2 does not contain element H, and...
	not(contains(H, S2)),				% ... H is not in S2
	symmetric_diff(T, S2, T1).			% ... T1 is the symmetric difference of tail of S1 and S2.

symmetric_diff([H|T], S2, S3) :-		% Recursive case: For situations when H is contained in both set and is therefore not an element of the result.
	set(T),								% T is a set.
	set(S2),							% S2 is a set.
	contains(H, S2),					% H is also contained in S2,
	delete_one(H, S2, I),				% I is S2 with H deleted,
	symmetric_diff(T, I, S3).			% S3 is symmetric difference of tail of S1 and S2 with all occurences of H removed.