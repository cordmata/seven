(ns clojure_seven.barber)

(def max-chairs 3)
(def time-open (* 10 1000))
(def length-of-haircut 20)

(def shop-open? (atom false))
(def barber-busy? (ref false))
(def open-chairs (ref max-chairs))
(def lost-customers (ref 0))
(def haircut-count (ref 0))

(def customer-waiting? #(< @open-chairs max-chairs))
(def work-to-do? #(or @shop-open? (customer-waiting?)))
(def chair-available? #(and (customer-waiting?) (not @barber-busy?)))

(defn generate-customers []
  (future
    (while @shop-open?
      (let [tt-next-cust (+ (rand-int 20) 10)]
        (Thread/sleep tt-next-cust)
        (dosync
          (if (> @open-chairs 0)
            (alter open-chairs dec)
            (alter lost-customers inc)))))))

(defn give-haircut []
  (dosync
    (ref-set barber-busy? true)
    (alter open-chairs inc))
  (Thread/sleep length-of-haircut)
  (dosync
    (ref-set barber-busy? false)
    (alter haircut-count inc)))

(defn operate-shop []
  (future (while (work-to-do?) (if (chair-available?) (give-haircut)))))

(defn print-progress []
  (print "\rI've given" @haircut-count "haircuts, lost"
         @lost-customers "customers, and have" @open-chairs
         "seats available.")
  (flush))

(defn monitor-progress []
  (future (while (work-to-do?) (print-progress) (Thread/sleep 100))))

(defn open-shop []
  (reset! shop-open? true)
  (generate-customers)
  (operate-shop)
  (monitor-progress)
  (Thread/sleep time-open)
  (reset! shop-open? false))

(open-shop)
(Thread/sleep 60)
(print-progress)
(println " Done!")
(shutdown-agents)

