(reset)

(deftemplate driver 
    (slot name)
    (slot age)
    (slot price)
    (slot commute-distance)
    (slot offence-points)
    (slot credit-score))
(deftemplate age-risk-factor(slot name)(slot percentage))
(deftemplate price-risk-factor(slot name)(slot percentage))
(deftemplate commute-risk-factor (slot name)(slot percentage))
(deftemplate offence-risk-factor (slot name)(slot percentage))
(deftemplate credit-risk-factor (slot name)(slot percentage))

(deftemplate insurance-premium (slot name)(slot premium))


(deffacts customers
    (driver 
        (name Sarah)
        (age 18.5)
        (price 5000)
        (commute-distance 20)
        (offence-points 10)
        (credit-score 700.5))
    (driver
        (name Daniel)
        (age 18)
        (price 5001)
        (commute-distance 20.5)
        (offence-points 11)
        (credit-score 700)))
(reset)



(defrule age-risk-factor-1
    (driver (name ?name)(age ?g &:(or(<= ?g 18)(>= ?g 75))))
    =>
    (assert(age-risk-factor(name ?name)(percentage 5))))
(defrule age-risk-factor-2
    (driver (name ?name)(age ?g &:(and(> ?g 18)(< ?g 75))))
        =>
    (assert(age-risk-factor(name ?name)(percentage 0))))
(defrule price-risk-factor-1
    (driver(name ?name)(price ?prf &:(<= ?prf 5000)))
    =>
    (assert(price-risk-factor(name ?name)(percentage 10))))
(defrule price-risk-factor-2
    (driver(name ?name)(price ?prf &:(and(> ?prf 5000)(< ?prf 20000))))
    =>
    (assert(price-risk-factor(name ?name)(percentage 5))))
(defrule price-risk-factor-3
    (driver(name ?name)(price ?prf &:(>= ?prf 20000)))
    =>
    (assert(price-risk-factor(name ?name)(percentage 10))))

(defrule commute-risk-factor-1
    (driver(name ?name)(commute-distance ?crf &:(<= ?crf 20)))
    =>
    (assert(commute-risk-factor (name ?name)(percentage 0))))
(defrule commute-risk-factor-2
    (driver(name ?name)(commute-distance ?crf &:(and(> ?crf 20)(< ?crf 50))))
    =>
    (assert(commute-risk-factor (name ?name)(percentage 2))))
(defrule commute-risk-factor-3
    (driver(name ?name)(commute-distance ?crf &:(>= ?crf 50)))
    =>
    (assert(commute-risk-factor (name ?name)(percentage 5))))
(defrule offence-risk-factor-1
    (driver (name ?name)(offence-points ?orf &:(<= ?orf 10)))
    =>
    (assert(offence-risk-factor (name ?name)(percentage 0))))
(defrule offence-risk-factor-2
    (driver(name ?name)(offence-points ?orf &:(and(> ?orf 10)(< ?orf 20))))
    =>
    (assert(offence-risk-factor (name ?name)(percentage 2))))
(defrule offence-risk-factor-3
    (driver(name ?name)(offence-points ?orf &:(>= ?orf 20)))
    =>
    (assert(offence-risk-factor (name ?name)(percentage 10))))
(defrule credit-risk-factor-1
    (driver(name ?name)(credit-score ?score &:(>= ?score 700)))
    =>
    (assert(credit-risk-factor (name ?name)(percentage 0))))
(defrule credit-risk-factor-2
    (driver(name ?name)(credit-score ?score &:(and(> ?score 600)(< ?score 700))))
    =>
    (assert(credit-risk-factor (name ?name)(percentage 2))))
(defrule credit-risk-factor-3
    (driver(name ?name)(credit-score ?score &:(<= ?score 600)))
    =>
    (assert(credit-risk-factor (name ?name)(percentage 5))))
(defrule total-average-risk
    (age-risk-factor(name ?name)(percentage ?arf))
    (price-risk-factor(name ?name)(percentage ?prf))
    (commute-risk-factor(name ?name)(percentage ?crf))
    (offence-risk-factor(name ?name)(percentage ?orf))
    (credit-risk-factor(name ?name)(percentage ?score))
    =>
    (bind ?sum (+ ?arf ?prf ?crf ?orf ?score))
    (bind ?total (/ ?sum 5))
    (bind ?prfremium (* 700 (+ 1 ?total)))
    (assert(insurance-premium(name ?name)(premium ?prfremium)))
     ) 
(run)
(facts)

