(ns day-1.test.core
  (:use [day-1.core])
  (:use [clojure.test]))


(deftest big-returns-true-on-negative-numbers
  (is true (big "" -1)))

(deftest big-returns-true-on-0-and-any-string
  (is true (big "hello" 0)))

(deftest big-returns-false-on-small-strings
  (is (= false (big "hello" 100))))




(deftest collection-type-works-on-lists
  (is (= :list (collection-type '(1 2) ))))

(deftest collection-type-works-on-vectors
  (is (= :vector (collection-type [1 2] ))))

(deftest collection-type-works-on-lists
  (is (= :map (collection-type {} ))))
