% It is wet if it is raining
wet :- raining.

% Is it raining and sunny at the same time?
% ?-raining, sunny.

% It is nice when it is sunny and without wind.
nice :-
	sunny,
	without_wind.

% X beat Y if Y surrendered or if X collected more points than Y.

beat(X, Y) :-
	surrendered(Y, X);
	(points(X, Tx),
	points(Y, Ty),
	Tx > Ty).

% Everything passes
passes(_).

% A person has an address, if the personal record contains the addres. We are not
% interested in other data.

address(Name, Address) :-
	person(Name,_,_,Address).

% X is a grandmother of Y, if X is a mother of Z and Z is mother or father of Y

grandmother(X, Y) :-
	mother(X, Z),
	(mother(Z, Y);
	father(Z, Y)).

% The = and == "operators"

% The = "operator" in Prolog is actually a predicate (with infix notation) =/2 that succeeds 
% when the two terms are unified. Thus X = 2 or 2 = X amount to the same thing, a goal to unify X with 2.

% The == "operator" differs in that it succeeds only if the two terms are already 
% identical without further unification. Thus X == 2 is true only if the variable X had previously 
% been assigned the value 2.

% manca is a child of katja and alen is a child of stanislava
child(katja, manca).
child(stanislava, alen).

% does anyone have a child?
% child(_,_).

% A woman likes a man if he is handsome, rich or smart.
likes(Woman, Man) :-
	is_woman(Woman),
	handsome(Man);
	rich(Man);
	smart(Man).

% Is Leo older than 10?
% old(leo, X), X > 10

% Boris plays instruments that Mojca and Sonja play.

plays(boris, Instrument) :-
	plays(mojca, Instrument),
	plays(sonja, Instrument),
	instrument(Instrument).

% Is there anyone who plays every instrument?
plays_all_instruments :-
	person(X),
	not((instrument(I), not(plays(X, I)))).

% Is it true that noone likes wine?
% not((person(X), likes(X, wine))).

% Does everyone like wine?
% not((person(X), not(likes(X, wine)))).

% A predicate that returns true if X is head and Y is tail of list.
head_and_tail([X|Y], X, Y).

% writing 
% head_and_tail([1,2,3,4,5], H, T).
% yields
% H = 1,
% T = [2, 3, 4, 5].

% This predicate can also be used to concatenate a head to a tail.
% head_and_tail(L, a, [b, c, d]).