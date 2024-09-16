(define (caar x) (car (car x)))
(define (cadr x) (car (cdr x)))
(define (cdar x) (cdr (car x)))
(define (cddr x) (cdr (cdr x)))

;; Problem 15
;; Returns a list of two-element lists
(define (enumerate s)
  ; BEGIN PROBLEM 15
  (cond 
    ((null? s) nil)
    ((null? (cdr s)) (cons (cons 0 s) nil))
    (else (cons (list 0 (car s))
            (map (lambda (x) (cons (+ 1 (car x)) (cdr x)))
              (enumerate (cdr s))))
    )
  )
)
  ; END PROBLEM 15

;; Problem 16

;; Merge two lists LIST1 and LIST2 according to ORDERED? and return
;; the merged lists.
(define (merge ordered? list1 list2)
  ; BEGIN PROBLEM 16
  (cond 
    ((null? list1) list2)
    ((null? list2) list1)
    (else (if (ordered? (car list1) (car list2))
            (cons (car list1) (merge ordered? (cdr list1) list2))
            (cons (car list2) (merge ordered? list1 (cdr list2)))
          ))
  )
)
  ; END PROBLEM 16

;; Optional Problem 2

;; Returns a function that checks if an expression is the special form FORM
(define (check-special form)
  (lambda (expr) (equal? form (car expr))))

(define lambda? (check-special 'lambda))
(define define? (check-special 'define))
(define quoted? (check-special 'quote))
(define let?    (check-special 'let))

;; Converts all let special forms in EXPR into equivalent forms using lambda
(define (let-to-lambda expr)
  (cond ((atom? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         expr
         ; END OPTIONAL PROBLEM 2
         )
        ((quoted? expr)
         ; BEGIN OPTIONAL PROBLEM 2
         expr
         ; END OPTIONAL PROBLEM 2
         )
        ((or (lambda? expr)
             (define? expr))
         (let ((form   (car expr))
               (params (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
            (cons 'lambda (cons params (let-to-lambda body)))
           ; END OPTIONAL PROBLEM 2
           ))
        ((let? expr)
         (let ((values (cadr expr))
               (body   (cddr expr)))
           ; BEGIN OPTIONAL PROBLEM 2
           (cons (list 'lambda (car (zip values)) (let-to-lambda (car body))) (let-to-lambda (cadr (zip values))))
           ; END OPTIONAL PROBLEM 2
           ))
        (else
         ; BEGIN OPTIONAL PROBLEM 2
         (map let-to-lambda expr)
         ; END OPTIONAL PROBLEM 2
         )))

; Some utility functions that you may find useful to implement for let-to-lambda

(define (zip pairs)
  (if (null? pairs) (list nil nil)
    (list (cons (caar pairs) (car (zip (cdr pairs))))
      (cons (car (cdar pairs)) (cadr (zip (cdr pairs))))
    )
  )  
)
