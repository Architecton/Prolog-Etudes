%* Make a predicate delete_one(El, L, L1) which removes the first occurence of El from list L.

%* Make a predicate delete_all(El, L, L1) which removes all occurences of element El from the list L.

%* Make a predicate that checks if all elements in a list are equal.

%* Make a predicate is_longer(L, L1) that checks if list L is longer than list L1.

%* Make a predicate len which gets the length of list L.

%* Make a predicate num_occurrences(El, L, N), so that the number N is the number of occurrences of element El in list L.

%* Make a procedure sum(L, Res) such that Res is the sum of integers in list L. L can contain non-integer structures.

% Make a procedure is_list(L) that checks if L is a list. 
% We don't consider [a,b,c|d] a list, because it does not end with an empty list [].

% Make a procedure is_palindrome(L) that checks if list L is a palindrome.

% // Auxilliary Predicates //

% Reverse a list

% Concatenating L to empty list yield L.

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