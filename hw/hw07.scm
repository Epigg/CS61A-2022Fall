(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define (ascending? asc-lst) 
    (if (or (null? asc-lst) (null? (cdr asc-lst)))
        #t
        (and (<= (car asc-lst) (car (cdr asc-lst)))
             (ascending? (cdr asc-lst)))))
        

(define (square n) (* n n))

(define (pow base exp) 
    (if (= exp 0) 1 
        (if (even? exp) (square (pow base (quotient exp 2)))
            (* base (square (pow base (quotient exp 2)))) )))
    
