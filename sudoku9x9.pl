hasValue(X) :- X=1; X=2; X=3; X=4; X=5; X=6; X=7; X=8; X=9.

haveValues(X1, X2, X3, X4, X5, X6, X7, X8, X9) :-
    hasValue(X1),
    hasValue(X2),
    hasValue(X3),
    hasValue(X4),
    hasValue(X5),
    hasValue(X6),
    hasValue(X7),
    hasValue(X8),
    hasValue(X9).

notEqual(X1, X2, X3, X4, X5, X6, X7, X8, X9) :-
    X1\=X2,
    X1\=X3,
    X1\=X4,
    X1\=X5,
    X1\=X6,
    X1\=X7,
    X1\=X8,
    X1\=X9.

notEquals(X1, X2, X3, X4, X5, X6, X7, X8, X9) :-
    \+ member(X1, [X2, X3, X4, X5, X6, X7, X8, X9]),
    \+ member(X2, [X3, X4, X5, X6, X7, X8, X9]),
    \+ member(X3, [X4, X5, X6, X7, X8, X9]),
    \+ member(X4, [X5, X6, X7, X8, X9]),
    \+ member(X5, [X6, X7, X8, X9]),
    \+ member(X6, [X7, X8, X9]),
    \+ member(X7, [X8, X9]),
    \+ member(X8, [X9]).

condition(X1, X2, X3, X4, X5, X6, X7, X8, X9) :-
    haveValues(X1, X2, X3, X4, X5, X6, X7, X8, X9),
    notEquals(X1, X2, X3, X4, X5, X6, X7, X8, X9).

row(X1, X2, X3, X4, X5, X6, X7, X8, X9) :- condition(X1, X2, X3, X4, X5, X6, X7, X8, X9).
column(X1, X2, X3, X4, X5, X6, X7, X8, X9) :- condition(X1, X2, X3, X4, X5, X6, X7, X8, X9).

board(X11, X12, X13, X14, X15, X16, X17, X18, X19, X21, X22, X23, X24, X25, X26, X27, X28, X29, X31, X32, X33, X34, X35, X36, X37, X38, X39, X41, X42, X43, X44, X45, X46, X47, X48, X49, X51, X52, X53, X54, X55, X56, X57, X58, X59, X61, X62, X63, X64, X65, X66, X67, X68, X69, X71, X72, X73, X74, X75, X76, X77, X78, X79, X81, X82, X83, X84, X85, X86, X87, X88, X89, X91, X92, X93, X94, X95, X96, X97, X98, X99) :-
    row(X11, X12, X13, X14, X15, X16, X17, X18, X19),
    row(X21, X22, X23, X24, X25, X26, X27, X28, X29),
    row(X31, X32, X33, X34, X35, X36, X37, X38, X39),
    row(X41, X42, X43, X44, X45, X46, X47, X48, X49),
    row(X51, X52, X53, X54, X55, X56, X57, X58, X59),
    row(X61, X62, X63, X64, X65, X66, X67, X68, X69),
    row(X71, X72, X73, X74, X75, X76, X77, X78, X79),
    row(X81, X82, X83, X84, X85, X86, X87, X88, X89),
    row(X91, X92, X93, X94, X95, X96, X97, X98, X99),

    column(X11, X21, X31, X41, X51, X61, X71, X81, X91),
    column(X12, X22, X32, X42, X52, X62, X72, X82, X92),
    column(X13, X23, X33, X43, X53, X63, X73, X83, X93),
    column(X14, X24, X34, X44, X54, X64, X74, X84, X94),
    column(X15, X25, X35, X45, X55, X65, X75, X85, X95),
    column(X16, X26, X36, X46, X56, X66, X76, X86, X96),
    column(X17, X27, X37, X47, X57, X67, X77, X87, X97),
    column(X18, X28, X38, X48, X58, X68, X78, X88, X98),
    column(X19, X29, X39, X49, X59, X69, X79, X89, X99).
