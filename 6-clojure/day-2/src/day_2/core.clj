(ns day-2.core)

; the implementation of some of the commonly used macros in Clojure

; when, -> http://clojure.org/macros


; an example of defining your own lazy sequence

; fib, primes, powers of 2: http://richhickey.github.com/clojure-contrib/lazy-seqs-api.html


; find the current status of defrecord and protocol

; being used, and in some cases prefered to using plain maps - http://stackoverflow.com/questions/4575170/where-should-i-use-defrecord-in-clojure



; implement an unless with else condition using macros

(defmacro unless [test body & [elsebody]]
  (list 'if (list 'not test ) body elsebody))

(macroexpand '(unless condition body elsebody))



; write a type usinf defrecord that implements a protocol

(defprotocol Speaker
  (say [speaker message]))

(deftype Person [name]
  Speaker
  (say [_ message] (str name ": " message)))



