(defrule whithout-khabarovsk
    ?khabarovsk <- (rep ? Khabarovsk)
    =>
        (retract ?khabarovsk)
)

(defrule whithout-syktyvkar
    ?syktyvkar <- (rep ? Syktyvkar)
    =>
        (retract ?syktyvkar)
)

(defrule result
    (declare (salience -1))
    =>
        (facts)
        (save-facts "moscow")
)
