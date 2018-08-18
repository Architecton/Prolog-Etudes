% Make a predicate fibonacci which gets the nth fibonacci term.
fibonacci(0, 0).		% Base case: the 0th fibonacci term is 0.
fibonacci(1, 1).		% Base case: the 0th fibonacci term is 1.
fibonacci(N, Res) :-	% Recursive case: the next fibonacci term is the sum of the previous two fibonacci terms.
	N1 is N-1,
	N2 is N-2,
	fibonacci(N1, Res1),
	fibonacci(N2, Res2),
	Res is Res1 + Res2.


% Make a predicate fibonacci terms that maps a list of integers to list of fibonacci terms with integers as the indices.
fibonacci_terms([], []).			% Base case: empty list
fibonacci_terms([I|T], [I1|T1]) :-	% Recursive case: make head I-th fibonacci term and recur for tail.
	fibonacci(I, I1),
	fibonacci_terms(T, T1).