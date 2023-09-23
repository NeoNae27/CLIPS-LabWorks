(deffunction counter (?count)
    (while (> ?count 0)
    (println ?count)
    (bind ?count (- ?count 1)))
    (return(void))
)

