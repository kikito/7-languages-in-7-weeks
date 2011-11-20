(ns day-3.test.core
  (:use [day-3.core])
  (:use [clojure.test]))


(deftest an-account-can-be-initialized-with-credit
  (credit 1 10)
  (is (= 10 (balance 1))))

(deftest an-account-can-receive-more-credit
  (credit 2 10)
  (credit 2 5)
  (is (= 15 (balance 2))))

(deftest an-account-can-receive-debit
  (credit 3 10)
  (debit 3 2)
  (is (= 8 (balance 3))))

