% Make a predicate delete_one(El, L, L1) which removes the first occurence of El from list L.

% Make a predicate delete_all(El, L, L1) which removes all occurences of element El from the list L.

% Make a predicate that checks if all elements in a list are equal.

% Make a predicate is_longer(L, L1) that checks if list L is longer than list L1.

% Make a predicate len which gets the length of list L.

% Make a predicate num_occurrences(El, L, N), so that the number N is the number of occurrences of element El in list L.

% Make a procedure sum(L, Res) such that Res is the sum of integers in list L. L can contain non-integer structures.


% Make a procedure is_list(L) that checks if L is a list. 
% We don't consider [a,b,c|d] a list, because it does not end with an empty list [].

% Make a procedure is_palindrome(L) that checks if list L is a palindrome.

% The reversed list of an empty list is an empty list.

% // Auxilliary Predicates //

% Reverse a list

% Concatenating L to empty list yield L.

% //

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

% nth: auxiliary predicate for finding nth element in list (see exercises1.pl).

% Make a predicate convert_digits(Digits, R) which converts a list of digits to a number by concatenating them.

% pow: auxiliary predicate for getting a power of an integer.

% Make a predicate setify that matches a list to a list with no duplicates.

% Make a predicate that checks if a list contains a sequence of integers such that every next integer is the sum of all the previous integers in the list.

% Make a predicate union(S1, S2, S3) so that S3 is an union of S1 and S2

% Make a predicate intersection(S1, S2, S3) so that S3 is the intersection of S1 and S2.

% Make a predicate symmetric_diff(S1, S2, S3) so that S3 is the symmetric difference of S1 and S2.