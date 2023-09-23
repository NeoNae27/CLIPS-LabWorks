(deffacts resistors ; This is database
    (resistor Ra 2)
    (resistor Rb 5)
    (resistor Rc 7)
)

(deffunction om ;  This is function om(x, y)
    (?x ?y)
    (div ?y ?x)
)

(defrule input ; This is current & strait input
    =>
    (printout t crlf "Input current value: ")
    (bind ?i (read))
    (printout t "Input strait value: ")
    (bind ?u (read))
    (assert (numbers ?i ?u))
)

(defrule take ; Get resistor from databaes
    (numbers ?i ?u)
    (resistor ?r =(om ?i ?u))
    =>
    (printout t crlf "You must take resistor " ?r "." crlf 
    crlf)
    (reset)
    (halt)
)

(defrule nothing ; There is nothing
    (numbers ?i ?u)
    (resistor ?r ~=(om ?i ?u))
    =>
    (printout t crlf "There is nothing in my database!" crlf 
    crlf)
    (reset)
    (halt)
)

