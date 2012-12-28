(ns clojure_seven.test.core
  (:use [clojure_seven.core])
  (:use [clojure.test]))

(deftest test-big
  (is (big "I'm big" 3) "Testing larger.")
  (is (not (big "same" 4)) "Testing equal.")
  (is (not (big "I'm small" 200)) "Testing smaller."))

(deftest test-collection-type

  (def types ;; map of the types/collections to test
    {:map {:im "a map"}
     :set #{:im :a :set}
     :list (list :im :a :list)
     :vector [:im :a :vector]})

  ;; iterate the types map testing that the types are correct
  (doseq [[coltype col] types]
    (is (= coltype (collection-type col)) "Ensure type is correct.")
    ;; test that this collection's type is not any of the other defined types
    (doseq [[otherct _] types :while (not= otherct coltype)]
      (is (not= otherct (collection-type col))
           "Ensure type is not identified as any other type."))))
