# Sudoku
This is a Sudoku generater and solver programmed in Prolog.

## Auto-generate
To auto-generate a
* 2x2 Sudoku, run sudoku2x2.pl with
```board(X11, X12, X21, X22).```
* 9x9 Sudoku, run sudoku9x9.pl with 
```board(X11, X12, X13, X14, X15, X16, X17, X18, X19, X21, X22, X23, X24, X25, X26, X27, X28, X29, X31, X32, X33, X34, X35, X36, X37, X38, X39, X41, X42, X43, X44, X45, X46, X47, X48, X49, X51, X52, X53, X54, X55, X56, X57, X58, X59, X61, X62, X63, X64, X65, X66, X67, X68, X69, X71, X72, X73, X74, X75, X76, X77, X78, X79, X81, X82, X83, X84, X85, X86, X87, X88, X89, X91, X92, X93, X94, X95, X96, X97, X98, X99).```

This will give an assignment of every variable.

## Solve
To solve a Sudoku, substitute the variable corresponding to a given entry with its value.
The rest of the variables will be assigned a value.

For instance, let's solve a 2x2 Sudoku.
Let X12 be the entry in row 1 and column 2.
If X12 has the value 1, then substitute it in the above call to sudoku2x2.pl: ```board(X11, 1, X21, X22).```
This will give the following assignments:
X11 = 2, X21 = 1, X22 = 2.

The same is done for a 9x9 Sudoku.

# Prolog Generator
To auto-generate a NxN Sudoku generator and solver, run sudokuGenerator.scm with ```(display (generate-sudoku-prolog-program N))``` where N is some integer.

# Online Interpreter
An online interpreter for Prolog can be found here:
http://swish.swi-prolog.org/
  
