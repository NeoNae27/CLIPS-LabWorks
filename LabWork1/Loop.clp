(defrule loopWord
    =>
    (printout t "Enter the number of iterations:")
    (bind ?i (read))
    (loop-for-count ?i do
    (printout t "Hello!" crlf))    
)