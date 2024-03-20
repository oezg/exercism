(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [[frst]] 
  frst)

(defn second-card
  "Returns the second card from deck."
  [[_ snd]]
  snd)

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [[fst snd & rest]]  
  (remove nil? (conj (conj rest fst) snd)))

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [[fst & rest]] 
  [fst rest])

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [[fst & rest]]
  (remove nil? (conj (concat face-cards rest) fst)))
