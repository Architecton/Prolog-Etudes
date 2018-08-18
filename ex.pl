factorial(0, 1).
factorial(N, Res) :-
	N1 is N-1,
	factorial(N1, Res1),
	Res is N * Res1.

fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, R) :-
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1, R1),
	fibonacci(N2, R2),
	R is R1 + R2.

squares([], []).
squares([I|T], [I1|T1]) :-
	I1 is I*I,
	squares(T, T1).

fibonacci_terms([], []).
fibonacci_terms([I|T], [I1|T1]) :-
	fibonacci(I, I1),
	fibonacci_terms(T, T1).
