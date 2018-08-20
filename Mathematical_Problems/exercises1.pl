% Make a predicate s(N, N1), which is true if N1 = N + 1. The predicate shoudl work for all 4 possible situations:
% As a check, as a successor generator, as a predecessor generator and as a generator of pairs of positive integers in relation s.
s(N, N1) :-			% N1 is successor of N if...
	integer(N),		% N is an integer,
	!,
	N1 is N+1.		% N1 is one larger than N.

s(N, N1) :-			% N is predecessor of N1 if...
	integer(N1),	% N1 is an integer,
	!,
	N is N1-1.		% N is one less than N1.

s(0, 1).
s(N1, N2) :-
	s(_, N1),
	N2 is N1 + 1.


% Make a predicate issum(A, B, Summa), which checks if A + B = Summa. You may only use the predicate s from the previous task. A and B can be
% positive or equal to 0.
issum(A, 0, A) :- !.	% Base case: A + 0 = A
issum(A, B, Sum) :-		% Recursive case: A + b = Sum if...
	s(B1, B),			% ...B1 is B-1,
	issum(A, B1, Sum1),	% A + B1 = A + (B - 1) = Sum1 = Sum - 1
	s(Sum1, Sum).		% Sum = Sum1 + 1 = (Sum - 1) + 1 = Sum.

% Make a predicate isdiff(A, B, Diff) which checks if A - B = Diff. 
% You may only use the predicate s from the previous task. A is greater or equal to 0, B is less or equal to A.
isdiff(A, 0, A) :- !.		% A - 0 = A.
isdiff(A, B, Diff) :-		% A - B = Diff if,
	s(B1, B),				% B1 = B - 1,
	isdiff(A, B1, Diff1),	% Diff1 = A - B1 = A - (B - 1) = A - B + 1,
	s(Diff, Diff1).			% Diff = A - B1 - 1 = A - (B - 1) - 1 = A - B.
% Even simpler: isdiff(A, B, C) :- issum(B, C, A).

% similar for product (isprod(A, B, Prod))
isprod(_,0,0) :- !. 		% A * 0 = 0
isprod(A, B, Prod) :- 		% A * B = Prod if...
	s(B1, B), 				% B1 = B - 1,
	isprod(A, B1, Prod1), 	% A * B = Prod1
	issum(Prod1, A, Prod). 	% Prod1 + A = Prod.

% similar for integer division (isdiv(A, B, Div))
isdiv(A, B, 0) :- B > A, !.	% A / B = 0 if B > A.
isdiv(A, B, Q) :- 			% A / B = Q if...
	isdiff(A, B, A1), 		% A - B = A1,
	isdiv(A1, B, Q1), 		% A1 / B = Q1,
	s(Q1, Q). 				% Q = Q1 + 1.

% Make a predicate num_digits(X, Digits) so that Digits is the numer of decimal digits of number X.
% You may only use predicates from the previous tasks.
num_digits(X, 1) :- X < 10,!. % If x < 10 then number of digits is 1.
num_digits(X, C) :- 		  % Num if x >= 10, num digits is C if...
	isdiv(X, 10, X1),		  % X1 is X / 10,
	num_digits(X1, C1),		  %	num digits in X1 is C1,
	s(C1, C).				  % C = C1 + 1.

% Make a predicate power(A, Pow, Res) so that Res is equal to A^Pow. Pow is an integer greater or equal to 0.
% You may only use predicates from the previous tasks.
pow(_, 0, 1) :- !. 		% Anything raised to 0 is 1.
pow(X, Pow, Res) :- 	% X^Pow = Res if... 
	s(Pow1, Pow), 		% Pow1 = Pow - 1,
	pow(X, Pow1, Res1), % X^Pow1 = Res1
	prod(Res1, X, Res). % Rex1 * X = Res.

% Make a predicate abs(X, AbsX) so that AbsX = |X|
abs(X, X) :- X >=0.	% Positive number - no need to change sign.
abs(X, AbsX) :-		% The absolute value of X is AbsX if...
	X < 0,			% X is negative,
	AbsX is -X.		% AbsX = -X.

% Make a predicate sign(X, signX) so that signX is equal to 1 if X > 0, equal to 0 if X = 0 and equal to -1 if  X < 0.
sign(X, 1) :- X > 0.
sign(X, 0) :- X == 0.
sign(X, -1) :- 0 > X. 

% Make a predicate between(X, Lower, Upper) that generates all integers on interval (Lower, Upper)
between(X, Lower, Upper) :- % X is between Lower and Upper if...
	X is Lower + 1, 		% X is one greater than lower,
	X < Upper. 				% X is less than Upper.

between(X, Lower, Upper) :-		% X is between Lower and Upper if...
	Lower < Upper,				% ...Lower is less than Upper,
	Lower1 is Lower + 1,		% ...Lower1 = Lower + 1,
	between(X, Lower1, Upper).	% ...X is between Lower1 and Upper. The first between predicate will be used after this point.


% Make a predicate not_prime(X) which checks if X has a divisor that is not equal to 1 or X (is not prime).
not_prime(X) :-			% X is not prime if...
	between(N, 1, X), 	% N is some number between 1 and X,
	between(M, 1, X), 	% M is some number between 1 and X,
	X is M * N. 		% X is a product of M and N and therefore not prime.

% Make a predicate is_prime(X) which checks if X is a prime number
is_prime(X) :- 			% X is a prime number if...
	not(not_prime(X)). 	% it has a divisor.