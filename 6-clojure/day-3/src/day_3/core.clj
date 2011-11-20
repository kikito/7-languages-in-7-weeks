(ns day-3.core)

; find a queue implementtion that blocks when the queue is empty and waits for a new item in the queue

; fill-queue: http://richhickey.github.com/clojure-contrib/seq-utils-api.html


; use refs to create a vector of accounts in memory create a credit and debit functions to change their balance

(def accounts (ref [0 0 0 0 0]))

(defn balance [id]
  (nth @accounts id))

(defn credit [id amount]
  (dosync
    (alter accounts assoc id (+ amount (balance id)))))

(defn debit [id amount]
  (dosync
    (alter accounts assoc id (- (balance id) amount))))
