(deffunction ask (?question)
    (printout t ?question " -> " )
    (bind ?answer (read))
    ?answer
)
