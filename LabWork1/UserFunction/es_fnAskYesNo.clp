(deffunction ask (?question)
    (printout t ?question " -> " )
    (bind ?answer (read))
    ?answer
)

(deffunction ask-allowed (?question $?allowed)
    (bind ?answer (ask ?question))
    (while (not (member$ ?answer $?allowed)) do
        (printout t " Repeat, please " crlf)
        (bind ?answer (ask ?question))
    )
    ?answer
)

(deffunction ask-yes-no (?question)
    (bind ?response (ask-allowed ?question yes no))
    (eq ?response yes)
)