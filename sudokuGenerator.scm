;; Auxiliary
(define linebreak "\n")
(define tab "  ")
(define (var1 x) (string-append "X" (number->string x)))
(define (var2 x y) (string-append "X" (number->string x) (number->string y)))
(define (var2-flipped x y) (string-append "X" (number->string y) (number->string x)))
(define (pred1 pred var) (string-append pred "(" var ")"))
(define (equal1 x) (string-append "X=" (number->string x)))
(define (unequal2 x y) (string-append x " \\= " y))
(define (iterator f g x y)
  (if (<= y x)
      (f x)
      (g (f x) (iterator f g (1+ x) y))))
(define (separator f delimitor n)
  (iterator f (lambda (x rest) (string-append x delimitor rest)) 1 n))
(define (separatorM f delimitor m n)
  (iterator f (lambda (x rest) (string-append x delimitor rest)) m n))
(define (vars1 n) (separator var1 ", " n))

;; Generators
;;; hasValue
(define (hasValue n)
  (string-append "hasValue(X) :- "
                 (separator equal1 "; " n)
                 "."))

;;; haveValues
(define (haveValues n)
  (string-append "haveValues("
                 (vars1 n)
                 ") :- "
                 (separator (lambda (x) (pred1 "hasValue" (var1 x))) ", " n)
                 "."))

;;; notEquals
(define (notEquals n)
  (letrec ([visit (lambda (x)
                    (if (<= (1- n) x)
                        (string-append"\\+ member("
                                      (var1 x)
                                      ", [" (separatorM var1 ", " (1+ x) n) "]).")
                        (string-append "\\+ member("
                                       (var1 x)
                                       ", [" (separatorM var1 ", " (1+ x) n) "]), "
                                       (visit (1+ x)))))])
    (string-append "notEquals("
                   (vars1 n)
                   ") :- "
                   (visit 1))))

;;; condition
(define (condition n)
  (string-append "condition("
                 (vars1 n)
                 ") :- haveValues("
                 (vars1 n)
                 "), notEquals("
                 (vars1 n)
                 ")."))

;;; row
(define (row n)
  (string-append "row("
                 (vars1 n)
                 ") :- condition("
                 (vars1 n)
                 ")."))

;;; column
(define (column n)
  (string-append "column("
                 (vars1 n)
                 ") :- condition("
                 (vars1 n)
                 ")."))

;;; board
(define (generate-variable-names n)
  (letrec ([visit (lambda (x y)
                    (cond
                      [(and (<= n x)
                            (<= n y))
                       (var2 x y)]
                      [(< n y)
                       (visit (1+ x) 1)]
                      [else
                       (string-append (var2 x y)
                                      ", "
                                      (visit x (1+ y)))]))])
    (visit 1 1)))

(define (generate-predicates n predicate f)
  (letrec ([visit (lambda (x y)
                    (cond
                      [(and (<= n x)
                            (<= n y))
                       (var2 x y)]
                      [(<= n y)
                       (string-append (f x y)
                                      "), "
                                      predicate
                                      "("
                                      (visit (1+ x) 1))]
                      [else
                       (string-append (f x y)
                                      ", "
                                      (visit x (1+ y)))]))])
    (string-append predicate
                   "("
                   (visit 1 1)
                   ")")))

(define (generate-rows n)
  (generate-predicates n "row" var2))

(define (generate-columns n)
  (generate-predicates n "column" var2-flipped))

(define (board n)
  (string-append "board(" (generate-variable-names n) ") :- " linebreak
                 tab (generate-rows n) "," linebreak
                 tab (generate-columns n) "."
                 ))

;; Main
(define (generate-sudoku-prolog-program n)
  (string-append linebreak
                 (hasValue n) linebreak
                 (notEquals n) linebreak
                 (haveValues n) linebreak
                 (condition n) linebreak
                 (row n) linebreak
                 (column n) linebreak
                 (board n) linebreak
                 ))

'Loaded
(display (generate-sudoku-prolog-program 4))
