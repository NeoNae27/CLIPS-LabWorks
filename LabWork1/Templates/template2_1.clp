(deftemplate car "This is template for describing a car" 
    (slot color)
    (slot model)
    (multislot owner)
)

(deffacts initial-state
    (car (color red) (model Ford) (owner Ivanov Dime))
    (car (color black) (model Opel) (owner Semenov Petr))
    (car (color white) (model Mercedes) (owner Harriso Ford))
)

(defrule ListOfAutoOwners
    (car (color ?col) (model ?mod) (owner $?own))
    =>
    (printout t ?own " has " ?col " " ?mod crlf)
)