% Construct a predicate circshift_left(N, List, Result) which cyclicly shifts the elements in the list by N places to the left

circshift_left(0, List, List).
circshift_left(_, [El], [El]).
circshift_left(N, [H|T], Result) :-
	append_end(H, T, Intermediate),
	N1 is N-1,
	circshift_left(N1, Intermediate, Result).

append_end(El, [], [El]).
append_end(El, [H|T], [H|T1]) :-
	append_end(El, T, T1).

% Construct a predicate circshift_right(N, List, Result) which cyclicly shifts the elements in the list by N places to the right

circshift_right(0, List, List).
circshift_right(_, [El], [El]).
circshift_right(N, List, Result) :-
	get_last(List, Last),
	remove_last(List, Intermediate),
	append_front(Last, Intermediate, Intermediate2),
	N1 is N-1,
	circshift_right(N1, Intermediate2, Result).

get_last([], []).
get_last([El], El).
get_last([_|T], Res) :-
	get_last(T, Res).

remove_last([], []).
remove_last([_], []).
remove_last([H|T], [H|T1]) :-
	remove_last(T, T1).

append_front(El, List, [El|List]).

% Construct a predicate encode which encodes the message PROLOG given code substitutions {P=0000, R=0100, O=1000, L=1100, G=0110}.
sub("P", "0000").
sub("R", "0100").
sub("O", "1000").
sub("L", "1100").
sub("G", "0110").
encode([H], [H1]) :-
	sub(H, H1).

encode([H|T], [H1|T1]) :-
	sub(H, H1),
	encode(T, T1).

% Construct a predicate map which finds element at same index as El in the second list
map([El], [Result], El, Result).
map([El|_], [Result|_], El, Result).
map([_|T], [_|T1], El, Result) :-
	map(T, T1, El, Result).

% Construct a predicate caesar(K, In, Out) which encodes the list In using the caesar cypher with offset K
caesar(0, In, In).
caesar(K, [El], [Res]) :-
	circshift_left(K, [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z], Shifted_alphabet),
	map([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z], Shifted_alphabet, El, Res).

caesar(K, [H|T], [H1|T1]) :-
	circshift_left(K, [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z], Shifted_alphabet),
	map([a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z], Shifted_alphabet, H, H1),
	caesar(K, T, T1).

% Construct a predicated decypher_caesar which returns all decodings of a message using all shifts K
decypher_caesar(26, Message, Message).
decypher_caesar(Start, Message, Result) :-
	caesar(Start, Message, Intermediate),
	write(Intermediate),
	nl,
	Start_next is Start + 1,
	decypher_caesar(Start_next, Intermediate, Result).