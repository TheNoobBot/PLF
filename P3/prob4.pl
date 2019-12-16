% 4. The list a1...an is given. Write a predicate to determine all sublists strictly ascending of this list a.

% subset(l1..ln) =
%	[], n = 0
%	l1 + subset(l2..ln)
%	subset(l2..ln)

% subset(L:list, R:list)
% subset(i, o)

subset([], []).
subset([E|T], [E|R]):-
  subset(T, R).
subset([_|T], R):-
  subset(T, R).

% increasing(l1..ln) =
%	True, n = 0 || n = 1
%	False, l1 > l2
%	is_sorted(l2..ln), l2 >= l1

% increasing(L:list)
% increasing(i)
increasing([]):-!.
increasing([_]):-!.
increasing([H1, H2|T]):-
	H1 =< H2,
	increasing([H2|T]).

%generate_and_check(+L:list, -R:list)
%generate_and_check(l1..ln) =
%	[], n = 0
%	subset(l1..ln), increasing(subset(l1..ln))

generate([], []).
generate(L, K):-
	subset(L, K),
	increasing(K).

% allsolutions(N:number, R:list)
% allsolutions(i, o)

allsolutions(L, R) :-
    findall(Template, generate(L, Template), R).







