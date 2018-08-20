% Define some relations.
father(a, b).		% A is father of B
father(b, c).
father(c, d).
father(d, e).

ancestor(X, Y) :-
	father(Z, Y),
	ancestor(X, Z).

ancestor(X, Y, []) :-
	father(X, Y).

ancestor(X, Y, [Z|T]) :-
	father(Z, Y),
	ancestor(X, Z, T).