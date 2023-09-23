(deffunction iterate (?num)
    (bind ?i 0)
    (while TRUE do
    (if (>= ?i ?num) then
    (break))
    (print ?i " ")
    (bind ?i (+ ?i 1)))
    (println)
)