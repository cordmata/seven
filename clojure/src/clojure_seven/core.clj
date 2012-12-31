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

(defmacro unless [testcond trueclause falseclause]
  `(if (not ~testcond) ~trueclause ~falseclause))
