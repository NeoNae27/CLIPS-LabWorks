(deffunction remainder (?num)
    (if (= (mod ?num 2) 0) then
    (return "The number entered is even"))
    (if (<> (mod ?num 2) 0) then
    (return "The number entered is not even"))
)