% Make a predicate fibonacci which gets the nth fibonacci term.
fibonacci(0, 0).		% Base case: the 0th fibonacci term is 0.
fibonacci(1, 1).		% Base case: the 0th fibonacci term is 1.
fibonacci(N, Res) :-	% Recursive case: the next fibonacci term is the sum of the previous two fibonacci terms.
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1, Res1),
	fibonacci(N2, Res2),
	Res is Res1 + Res2.