(defrule FinaleRule
    (All Rules Activated)
    =>
    (printout t "All rules has been activated" crlf)
)

(defrule SecondRule
    (First Rule Activated)
    =>
    (printout t "Second rule activated" crlf)
    (assert (Second Rule Activated))
)

(defrule ThirdRule
    (First Rule Activated)
    (Second Rule Activated)
    =>
    (printout t "Third rule activated" crlf)
    (assert (All Rules Activated))
)

(defrule FirstRule
    =>
    (printout t "First rule activated" crlf)
    (assert (First Rule Activated))
)