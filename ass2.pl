% Write a predicate to Test Equality of two sets without using the set difference


% Version 1

% (i,i)
% (A - list, B - list)

% comp( a1,a2...an, b1,b2,..bm ) { true, both empty
%		 		 { a1 == b2 && comp( a2,...an, b2,...bm), otherwise  


% Returns true if both of them are empty
comp( [] , [] ).
% Compare the first element and call for the rest otherwise
comp( [H|T], [A|B] ):- H==A, comp(T, B)   .



% Version 2

% (i,i)
% (A - list, B - list)

%   comp2( a1,...an, B ) { true if first empty
%				{ mycontains(a1, B) && comp2(a2,..an, B), otherwise
%
%   mycontains(X, l1,...ln) { true, l1 == X  
% 			    { false, n == 0
%			    { mycontains(X, l2...ln), otherwise
	

% If first is empty then true
comp2( [], _).
% Search for L in list and call itself for the rest
comp2( [H|T], L ) :- mycontains(H, L), comp2(T, L).

% (i, i)
% (X - number, L - list)

% true when found
mycontains( X , [X|_] ).
% continue searching otherwise
mycontains( X , [A|T] ) :- X \= A, mycontains( X, T).

% Call This for version 2

% (i,i)
% (A - list, B - list)
compwrap( A, B ) :- comp2(A,B), comp2(B,A).



% Find nth element

% nth(N, l1...ln) { l1, N == 0
%		  { nth(N-1, l2...ln) , otherwise

% assigns the output variable when found
% (i, o ,i)
nth( 0 , X , [X|_]  ).
% continue searching otherwise
nth( N , X , [_|T] ) :-
  N > 0 ,
  N1 is N-1 ,
  nth( N1 , X , T ).
