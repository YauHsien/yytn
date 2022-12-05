:- encoding(utf8).

% yytn/4 有重複
yytn(Y, Yn, T, Yn2) :-
    Cases0 = [前,昨,今,明],
    Cases2 = [是,非],
    p(Cases0, [Y,T]),
    ( [Yn,Yn2] = Cases2
    ; [Yn2,Yn] = Cases2
    ).

walkaround :-
    setof(A-B-C-D, yytn(A,B,C,D), L),
    foreach( member(A-B-C-D, L),
             format("~w~w~w~w~n", [A,B,C,D]) ).

% Np2 有重複
p(List, Result) :-
    permutation(List, List2),
    findnsols(2, X, member(X,List2), Result).
