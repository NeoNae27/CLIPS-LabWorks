(deftemplate in
    (slot object (type SYMBOL))
    (slot location (type SYMBOL))
)

(deftemplate goal
    (slot object (type SYMBOL))
    (slot from (type SYMBOL))
    (slot to (type SYMBOL))
)

(deffacts world
    (in (object robot) (location RoomA))
    (in (object box) (location RoomB))
    (goal (object box) (from RoomB) (to RoomA))
)

(defrule move
    (goal (object ?X) (from ?Y))
    (in (object ?X ) (location ?Y))
    ?robot-position <- (in (object robot) (location ~?Y))
    =>
    (modify ?robot-position (location ?Y))
)

(defrule push
    (goal (object ?X) (from ?Y) (to ?Z))
    ?object-position <- (in (object ?X) (location ?Y))
    ?robot-position <- (in (object robot) (location ?Y))
    =>
    (modify ?robot-position (location ?Z))
    (modify ?object-position (location ?Z))
)

(defrule stop
    (goal (object ?X) (to ?Y))
    (in (object ?X) (location ?Y))
    =>
    (halt)
)