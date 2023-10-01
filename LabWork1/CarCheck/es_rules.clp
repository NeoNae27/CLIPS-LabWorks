(defrule EngineState
    (not (work ?))
    =>
    (bind ?message " <<< Vehicle diagnosing system >>> ")
    (printout t crlf ?message crlf crlf)
    (bind ?message "1 - The car won't start ")
    (bind ?message (str-cat ?message "2 - The car is not stable "))
    (bind  $?q (str-cat "Choose the problem:" ?message))
    (if (eq (ask-allowed $?q 1 2) 1)
        then (assert (work doesnot))
        else (assert (work unstable))
    )
)

(defrule KindOfFail
    (work doesnot)
    =>
    (bind ?m1 "1 - The engine does not rotate ")
    (bind ?m2 "2 - The engine does not start ")
    (bind $?q (str-cat ?m1 ?m2))
    (if (eq (ask-allowed $?q 1 2) 1)
        then (assert (engine does-not-rotate))
        else (assert (engine rotate))
    )
)

(defrule CheckBatt
    (engine does-not-rotate)
    =>
    (assert (suggest "Check battery or starter "))
)

(defrule UnstableIgnition
    (work unstable)
    (not (ignition ?))
    =>
    (assert (need to check ignition))
)

(defrule IgnitionCheck
    (not (ignition ?))
    (need to check ignition)
    =>
    (bind ?m1 "Is there a spark? ")
    (if (ask-yes-no (str-cat "Check ignition " ?m1))
        then (assert (ignition ok))
        else (assert (ignition fail))
    )
)

(defrule SuggestOfIgnition
    (ignition fail)
    (engine rotate)
    =>
    (bind ?m1 "Your engine does not start because ")
    (bind ?m2 "ignition is not working properly ")
    (assert (suggest (str-cat ?m1 ?m2)))
)

(defrule SuggestFuel
    (work unstable)
    (ignition ok)
    =>
    (bind ?m1 "Your engine work unstable because ")
    (bind ?m2 "fuel supply is not stable ")
    (assert (suggest (str-cat ?m1 ?m2)))
)

(defrule PrintSuggest
    (suggest ?x)
    =>
    (printout t ?x crlf)
)

(defrule NoSuggest
    (declare (salience -10))
    (not (suggest ?))
    =>
    (printout t "No suggests" crlf)
)