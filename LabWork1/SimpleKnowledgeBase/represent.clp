(defglobal ?*moscow* = 0)
(defglobal ?*syktyvkar* = 0)
(defglobal ?*khabarovsk* = 0)

(defrule start
    =>
        (printout t crlf "REPRESENTATIVES" crlf)
)

(defrule moscow
    (rep ? Moscow)
    =>
        (bind ?*moscow* (+ ?*moscow* 1))
)

(defrule syktyvkar
    (rep ? Syktyvkar)
    =>
        (bind ?*syktyvkar* (+ ?*syktyvkar* 1))
)

(defrule khabarovsk
    (rep ? Khabarovsk)
    =>
        (bind ?*khabarovsk* (+ ?*khabarovsk* 1))
)

(defrule result
    (declare (salience -1))
    =>
        (printout t "from Moscow: " ?*moscow* crlf)
        (printout t "from Syktyvkar: " ?*syktyvkar* crlf)
        (printout t "from Khabarovsk: " ?*khabarovsk* crlf)
)
