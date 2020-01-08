;gnu clisp 2.49


;Description: CSE 240 - Spring 2019 - Assignment 4 - LISP
        ;Learning lisp basics
        ;homework.lisp
				

;Completion Time: ~ 4 hours
 
;Emma Hermick
 
;Version 1.0

;**1**
;add(number number)
;add function - 2 numbers as param 
(defun add (num1 num2)
    ;returns sum of 2 numbers
    (+ num1 num2)
)

;**2**
;minimum (list)
;minimum function - list of numbers as param
(defun minimum  (list)
    ;search entire list and return smallest value  
    (if (= (length list) 1) 
        (car list)
        (if (< (car list) (minimum (cdr list)))
            (car list)
            (minimum (cdr list))))
)

;**3**
;average (list)
;average function - list of numbers as param
(defun average (list)
    ;returns average of all numbers in the list    
    (let ((length 0) (sum 0))
         (dolist (n list)
             (incf length)
             (incf sum n))
         (/ sum length)))

;**4**
;count-of(symbol list)
;count-of function - symbol and list as param
;count the # of instances of x in the list (not number in sublist)
(defun count-of(symbol list)
    (let ((counter 0))
        (dolist (value list counter)
            (when (equal symbol value)
                (incf counter))))
)

;**5**
;iteratve-factorial(number)
;iterative function 
(defun iterative-factorial(number)
    ;calculates the factorial of a positive integer and returns result
    (setq sum 1)
    (do (( i 1 (1+ i)))
        ((>= i number))
        (setq sum(* sum (1+ i)))
    )
     sum ;return sum
)

;**6**
;recursive-factorial(number)
;recursive function
(defun recursive-factorial(number)
    ;calculates factorial of a positive integer and returns result
    (if (<= number 1) 
        1 ;return 1
        (* number(recursive-factorial (- number 1)))
    )
)

;**7**
;fibonacci(number)
;fibonacci function - takes number n as param
(defun fibonacci(n)
    ;returns the nth number in fibonacci sequence
    (cond ((= n 0) 0) ;if n=0 -> 0
        ((= n 1) 1) ;if n=1 -> 1
        ((> n 1) (+ (fibonacci (- n 1)) (fibonacci (- n 2)))) ;else - positive
        ((< n 0) (+ (fibonacci (- n 1)) (fibonacci (- n 2)))) ;else - negative
    )
)

;**8**
;trim-to(symbol list)
;trim-to function takes a symbol and list as param
(defun trim-to(symbol list)
    ;return a new list starting from first occurrence of input symbol    
    (setf location (position symbol list)) ;find location of input symbol
    (subseq list location)
    
)

;**9**
;ackermann(number number)
;ackermann functon - two integers as param
(defun ackermann(x y)
    (cond ((= x 0) (1+ y)) ;if x=0 -> y+1
        ((= y 0) (ackermann(- x 1) 1)) ;if y=0 -> A(x-1,1)
        (t (ackermann(- x 1) (ackermann x (- y 1)))) ;else
     
     )

)

(defun test()
 (print (add 3 1))
 (print (average '(1 2 3 4 5 6 7 8 9)))
 (print (minimum '(5 78 9 8 3)))
 (print (count-of 'a '(a '(a c) d c a)))
 (print (iterative-factorial 5))
 (print (recursive-factorial 4))
 (print (fibonacci 6))
 (print (trim-to 'c '(a b c d e )))
 (print (ackermann 1 1))
 )

(test)