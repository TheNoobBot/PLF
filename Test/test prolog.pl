% Given a numerical linear list consisting of integers, substitute all
% the elements from even positions with the sum between it and the
% maximum value from the list

% model matematic
% maxList(L, M) { M, l empty
%               { maxList(L2.., L1), L1>M
%               { maxList(L2.., M), otherwise

% maxList(i,i,o)
maxList([], M, M).
maxList([H|T], M, O) :- H>M -> maxList(T, H, O); maxList(T, M, O).


% model matematic
% addEven(L, M, N) { [L1+M] + addEven(L2.., M, 1), N==0
%                  { L1 + addEven(L2.., M, 0), N==1
%                  { [], L is empty
% addEven(i,o,i,i)
addEven([H|T], R, M, 0) :-  addEven(T, RE, M, 1), A is H + M, R=[A | RE].
addEven([H|T], R, M, 1) :- addEven(T,RE,M,0), R=[H|RE].
addEven([], [], _, _).

% returns the result
%wrap(i,o)
wrap([H|T], R) :- maxList(T, H, O), addEven(T, RE, O, 0), R=[H|RE].
