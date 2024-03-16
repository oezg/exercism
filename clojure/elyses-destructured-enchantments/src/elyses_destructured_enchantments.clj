(ns elyses-destructured-enchantments)

(defn first-card
  "Returns the first card from deck."
  [deck]
  (let [[frst] deck]
    frst))

(defn second-card
  "Returns the second card from deck."
  [deck]
  (let [[_ snd] deck] snd))

(defn swap-top-two-cards
  "Returns the deck with first two items reversed."
  [deck]
  (let [[fst snd & rest] deck]
    (if (and fst snd)
      (conj (conj rest fst) snd)
      deck)))

(defn discard-top-card
  "Returns a sequence containing the first card and
   a sequence of the remaining cards in the deck."
  [deck]
  (let [[fst & rest] deck]
    [fst rest]))

(def face-cards
  ["jack" "queen" "king"])

(defn insert-face-cards
  "Returns the deck with face cards between its head and tail."
  [deck]
  (let [[fst & rest] deck]
    (if fst
      (conj (concat face-cards rest) fst)
      (concat face-cards rest))))
