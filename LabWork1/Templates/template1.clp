(deftemplate student "A student record"
    (slot name (type STRING))
    (slot age (type NUMBER) (default 18))
)

(deffacts students
    (student (name "Fred"))
    (student (name "Jack") (age 19))
)