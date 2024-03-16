(ns card-games)

(defn rounds
  "Takes the current round number and returns
   a `list` with that round and the _next two_."
  [n]
  (list n (+ 1 n) (+ 2 n)))

(defn concat-rounds
  "Takes two lists and returns a single `list`
   consisting of all the rounds in the first `list`,
   followed by all the rounds in the second `list`"
  [l1 l2]
  (concat l1 l2))

(defn contains-round?
  "Takes a list of rounds played and a round number.
   Returns `true` if the round is in the list, `false` if not."
  [l n]
  (.contains l n))

(defn card-average
  "Returns the average value of a hand"
  [hand]
  (float (/ (reduce + hand) (count hand))))

(defn approx-average?
  "Returns `true` if average is equal to either one of:
  - Take the average of the _first_ and _last_ number in the hand.
  - Using the median (middle card) of the hand."
  [hand]
  (or
   (== (card-average hand) (nth hand (/ (count hand) 2)))
   (== (card-average hand) (/ (+ (first hand) (last hand)) 2))))

(defn index-elements
  "This function takes a list lst as input, maps each element of the
     list along with its index using map-indexed, then filters out the
     elements at chosen indexes using filter, and finally extracts the
     elements from the filtered pairs using second."
  [lst f]
  (map second (filter #(f (first %)) (map-indexed vector lst))))


(defn average-even-odd?
  "Returns true if the average of the cards at even indexes
   is the same as the average of the cards at odd indexes."
  [hand]
  (= (card-average (index-elements hand odd?))
     (card-average (index-elements hand even?))))

(defn double-last
  "This function takes a list lst as input. It first removes the last
   element of the list using butlast, then doubles the last element
   using (* 2 (last lst)), and finally adds the doubled last element
   to the modified list using conj."
  [lst]
  (conj (vec (butlast lst)) (* 2 (last lst))))


(defn maybe-double-last
  "If the last card is a Jack (11), doubles its value
   before returning the hand."
  [hand]
  (if (not= 11 (last hand)) hand (double-last hand)))
