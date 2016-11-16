hasValue(X) :- X=1; X=2.

condition(X, Y) :- hasValue(X), hasValue(Y), X\=Y.
row(X, Y)    :- condition(X, Y).
column(X, Y) :- condition(X, Y).

board(X11, X12, X21, X22) :- row(X11, X12), row(X21, X22), column(X11, X21), column(X12, X22).
