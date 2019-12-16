% a. Merge two sorted lists with removing the double values
%
%
%
%
% merge(A,B) { A1 + merge(A2.., B2...), A1 == B1
%            { A1 + merge(A2.., B), A1<B1
%            { B1 + merge(A, B2..), B1<A1
%            { A, B.length == 0
%            { B, A.length == 0


%A-list, B-list, L - list
%merge(i,i,O)

merge([],L,L).
merge(L,[],L).
merge([Head1|Tail1], [Head2|Tail2], L) :-
    Head1 < Head2 -> merge(Tail1,[Head2|Tail2],R), L = [Head1|R] ;
    Head1 > Head2 -> merge([Head1|Tail1],Tail2,R), L = [Head2|R].
merge([H|Tail1], [H|Tail2], L) :-
    sort(Tail1, Tail2, R), L=[H|R].

% b. For a heterogeneous list, formed from integer numbers and list of numbers,
% merge all sublists with removing the double values
%
% merge2(L) { merge(L2, merge2(L2..)) , L1 is list
%           { merge2(L2..), L1 is number
%           { [], L is empty
%
%
%
% merge2(i, o)

merge2([],[]).

merge2([H | T], L) :-
    is_list(H), !,
    merge2(T, R),
    merge(H, R, L).

merge2([H | T], L) :-
    number(H), merge2(T, L).





