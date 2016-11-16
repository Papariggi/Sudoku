hasValue(X) :- X=1; X=2; X=3; X=4; X=5; X=6; X=7; X=8; X=9.

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
    notEqual(X1, X2, X3, X4, X5, X6, X7, X8, X9),
    notEqual(X2, X1, X3, X4, X5, X6, X7, X8, X9),
    notEqual(X3, X2, X1, X4, X5, X6, X7, X8, X9),
    notEqual(X4, X2, X3, X1, X5, X6, X7, X8, X9),
    notEqual(X5, X2, X3, X4, X1, X6, X7, X8, X9),
    notEqual(X6, X2, X3, X4, X5, X1, X7, X8, X9),
    notEqual(X7, X2, X3, X4, X5, X6, X1, X8, X9),
    notEqual(X8, X2, X3, X4, X5, X6, X7, X1, X9),
    notEqual(X9, X2, X3, X4, X5, X6, X7, X8, X1).

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
    
    column(X11, X12, X13, X14, X15, X16, X17, X18, X19),
    column(X21, X22, X23, X24, X25, X26, X27, X28, X29),
    column(X31, X32, X33, X34, X35, X36, X37, X38, X39),
    column(X41, X42, X43, X44, X45, X46, X47, X48, X49),
    column(X51, X52, X53, X54, X55, X56, X57, X58, X59),
    column(X61, X62, X63, X64, X65, X66, X67, X68, X69),
    column(X71, X72, X73, X74, X75, X76, X77, X78, X79),
    column(X81, X82, X83, X84, X85, X86, X87, X88, X89),
    column(X91, X92, X93, X94, X95, X96, X97, X98, X99).
