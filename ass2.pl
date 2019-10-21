% Write a predicate to Test Equality of two sets without using the set difference

comp( [] , [] ).
comp( [H|T], [A|B] ):- H==A, comp(T, B) .




comp2( [], _).
comp2( [H|T], L ) :- mycontains(H, L), comp2(T, L).

compwrap( A, B ) :- comp2(A,B), comp2(B,A).

mycontains( X , [X|_] ).
mycontains( X , [A|T] ) :- X \= A, mycontains( X, T).


% Find nth element


nth( 0 , X , [X|_]  ).
nth( N , X , [_|Xs] ) :-
  N > 0 ,
  N1 is N-1 ,
  find_nth_element_of_list( N1 , X , Xs )
  .
