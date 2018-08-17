% Make a predicate factorial(N, Res) which computes the factorial of N.
factorial(0, 1).			% Base case: the factorial of 0 is 1.
factorial(N, Res) :-		% Recursive case: the factorial of N is N * (N-1)!
	N1 is N-1,
	factorial(N1, Res1),
	Res is N*Res1.