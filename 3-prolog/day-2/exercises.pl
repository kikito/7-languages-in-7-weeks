% find some implementations of fibonacci series and factorials. How do they work?

%  - http://cubbi.com/fibonacci/prolog.html
%
%    There are several options. The simplest (least efficient) is a naive recursion.
%    The rest (more efficient and complex) use some forms of caching - either with memoization or with lists.
%    There is an implementation that simply cheats and uses variables to create an iterative implementation.
%    Finally, the last one uses the Binet formula - http://mathworld.wolfram.com/BinetsFibonacciNumberFormula.html

% Find a real-world comunity using prolog. What real problems are they solving?

%  - http://stackoverflow.com/questions/130097/real-world-prolog-usage
%    The main example is a swedish company selling stuff to banks.

% An implementation of the Towers of Hanoi

hanoi(N) :- dohanoi(N, 3, 1, 2).

dohanoi(0, _ , _ , _ ) :- !.
dohanoi(N, A, B, C) :-
  N_1 is N-1,
  dohanoi(N_1, A, C, B),
  moveit(A, B),
  dohanoi(N_1, C, B, A).

moveit(F, T) :- write([move, F, -->, T]), nl.

% explanation: This implementation seems to be attempting all the possible combinations until it finds one that satisfies the constraints.
% The constraints are encoded in the way the first three parameters (3,1,2) are referenced on the dohanoi rule.
% brutish, but effective.


% what are some of the problems dealing with "not" expressions? Why do you have to be careful with negation in Prolog?

% negation in prolog means "that a rule can not be proven true". That is not the same as being false.
% a negation in one rule might make other rules, on wich that rule "had influence" become suddenly false. This is not always obvious.
%
% in addition to that, the "argument" of a not clause, when it includes variables, makes the rule deceptively "stupid".

legal(a).
legal(b).
legal(c).
other(d).
illegal(X) :- \+ legal(X).

%  illegal(a) returns no, as expected
%  illegal(X) returns also no (it does not magically return d)


% reverse the elements of a list

invert([],[]).
invert([X],[X]).
invert(I, [Head|Tail]) :- invert(Rest,Tail), append(Rest, [Head], I).

% find the smallest element of a list

smallest([X], X).
smallest([Head|Tail], X) :- smallest(Tail, TailMin), X is min(Head,TailMin).

% sort the elements of a list

% sorry,no. If you dont care enough to give me an interesting problem, Im not going to spend time solving it.

% http://google.com prolog quicksort





