(ns day-2.test.core
  (:use [day-2.core])
  (:use [clojure.test]))

(deftest regular-unless-works
  (is (= "works" (unless false "works") )))

(deftest inverse-regular-unless-works
  (is (nil? (unless true "foo"))))

(deftest unless-false-with-else-returns-first-param
  (is (= "works" (unless false "works" "does not work"))))

(deftest unless-true-with-else-returns-second-param
  (is (= "works" (unless true "does not work" "works"))))



(deftest people-can-talk
  (is (= "Peter: hello" (say (day_2.core.Person. "Peter") "hello"))))
