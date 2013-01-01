(ns clojure_seven.core)

(defn big "Check if supplied string s is larger than n characters in length."
  [s n] (> (count s) n))

(defn collection-type
  "Return a symbol describing the type of collection supplied."
  [col]
  (cond
    (map? col) :map
    (set? col) :set
    (list? col) :list
    (vector? col) :vector
    :else :no_idea))

(defmacro unless [testcond do-true do-false]
  `(if (not ~testcond) ~do-true ~do-false))

(defprotocol Eater
  (feed [self food] "Offer the Eater a dish. Return their reaction.")
  (likes? [self food] "Return true if the Eater enjoys the dish."))

(defn eat-politely [eater food]
  (if (likes? eater food) "Yum, thank you!" "Veeeeery interesting."))

(defrecord PickyEater []
  Eater
  (likes? [self food] (= food :chicken))
  (feed [self food] (if (likes? self food) "It's fine." "Ugh, so gross.")))

(defrecord AdventurousEater []
  Eater
  (likes? [self food] true)
  (feed [self food] (eat-politely self food)))

(defrecord SuggestibleEater [suggestions]
  Eater
  (likes? [self food] (contains? (set suggestions) food))
  (feed [self food] (eat-politely self food)))
