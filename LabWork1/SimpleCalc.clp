(defrule arifm1
	=>
	(printout t "Enter type of transaction (+/-):" crlf)
	(bind ?t (read))
	(printout t "Enter first number:" crlf)
	(bind ?n1 (read))
	(printout t "Enter second number:" crlf)
	(bind ?n2 (read))

	(switch ?t
	(case "+" then (printout t (+ ?n1 ?n2) crlf))
	(case "-" then (printout t (- ?n1 ?n2) crlf))
	(default FALSE)
	)	
)