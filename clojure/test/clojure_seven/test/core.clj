(ns clojure_seven.test.core
  (:use [clojure_seven.core])
  (:import [clojure_seven.core PickyEater AdventurousEater SuggestibleEater])
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
    (doseq [[otherct _] types :when (not= otherct coltype)]
      (is (not= otherct (collection-type col))
           "Ensure type is not identified as any other type."))))

(deftest test-unless-macro
  (is (= "ho" (unless true "hi" "ho")) "Test true unless clause")
  (is (= "hi" (unless false "hi" "ho")) "Test false unless clause"))


(deftest test-eaters
  (def picky (PickyEater.))
  (def adventurous (AdventurousEater.))
  (def suggestible (SuggestibleEater. [:greens :sausage :peas]))
  (is (= "It's fine." (feed picky :chicken)) "Test that the picky eater likes chicken.")
  (is (= "Ugh, so gross." (feed picky :cheese)) "Test that the picky eater doesn't like cheese.")
  (is (= "Yum, thank you!" (feed adventurous :squid)) "Test that the adventurous eater likes squid.")
  (is (= "Yum, thank you!" (feed suggestible :sausage)) "Test that the suggestable eater likes sausage.")
  (is (= "Veeeeery interesting." (feed suggestible :mushrooms)) "Test that the suggestable eater dislikes mushrooms."))
